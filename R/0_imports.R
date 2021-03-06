#' @importFrom rlang enquo expr enquos call2 eval_tidy new_quosure empty_env
#' @importFrom purrr map_lgl map_dbl map
#' @importFrom tibble is_tibble as_tibble tibble
#' @importFrom parsnip set_new_model new_model_spec update_dot_check null_value
#' @importFrom parsnip set_encoding set_model_arg eval_args predict.model_fit
#' @importFrom parsnip translate model_printer translate.default
#' @importFrom parsnip update_engine_parameters check_final_param
#' @importFrom parsnip update_main_parameters show_call
#' @importFrom withr with_options
#' @importFrom stats predict approx quantile
#' @importFrom dials new_quant_param
#' @importFrom tidyr pivot_longer gather
#' @importFrom dplyr group_nest %>% arrange
#' @importFrom baguette bag_tree
#' @importFrom utils getFromNamespace

utils::globalVariables(
  c(".time", "object", "new_data", ".label", ".pred")
)

# ------------------------------------------------------------------------------

# The functions below define the model information. These access the model
# environment inside of parsnip so they have to be executed once parsnip has
# been loaded.

.onLoad <- function(libname, pkgname) {

  # This defines cox_reg in the model database
  make_cox_reg_survival()
  make_cox_reg_glmnet()

  make_boost_tree_mboost()

  make_decision_tree_rpart()
  make_decision_tree_party()

  make_bag_tree_ipred()

  make_rand_forest_party()

  make_surv_reg_survival()
  make_surv_reg_flexsurv()

}
