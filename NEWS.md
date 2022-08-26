## vinecopulib 0.6.2 (August 24, 2022)

* updated cmake setup (#549)

* improved documentation (missing data and Rosenblatt transforms)

* better parallelization when there is a small number of edges (#555)


## vinecopulib 0.6.1 (July 13, 2021)

### BREAKING API CHANGES

- refactored serialization using `nlohmann::json` instead of `boost::property_tree` (#539):

  - `to_json` and `to_ptree` methods of both `Bicop` and `Vinecop` objects 
    are respectively renamed as `to_file` and `to_json`

  - internal structure of the serialized objects is changed (i.e., not 
    possible to read the old files with the new functions) 

### BUG FIXES

- use `num_threads` in recursive calls to the inverse Rosenblatt (#535)

- force TLL to be nonnegative (#532)

- fix number of parameters for TLL (#530)

- fix bugs in `Vinecop` print methods (#544)

## vinecopulib 0.5.5 (November 23, 2020)

### BUG FIXES

- fix little bug in copula selection based on mBIC (#527)

- stabilize BB7 copula pdf (#526)

- fix threshold selection for (near-)independent data (#523)

- fix `Vinecop::select()` for 1-dimensional models with discrete variables (#521)

- fix user-visible variable types messed up in `Bicop::flip()` (#519)

## vinecopulib 0.5.4 (September 30, 2020)

### BUG FIXES

- fix uninitialized number of parameters for TLL family (#515)

- fix Kendall's tau of Frank copula for par \<= 3 (#513)

- fix `Vinecop::pdf()` when discrete variables are present (#514)

## vinecopulib 0.5.3 (August 11, 2020)

### NEW FEATURES

- allow 1-dimensional models (#499) 

- make AIC default selection criterion (#502)

### BUG FIXES

- make Bicop/Vinecop objects indepent of copied-from-objects (#503)

- enforce parameters bounds in tau_to_parameters for Archimedean families (#507)

## vinecopulib 0.5.2 (May 7, 2020)

### NEW FEATURES

- `str()` methods for `FitControlsBicop` and 
  `FitControlsVinecop` (#494) 

### BUG FIXES

- fix documentation (#482, #493)

- fix bug in `RVineStructure::simulate()` (#492)

- fix tll family with comonotonic data (#491)

- fix weights handling in family preselection (#490) 

- fix archimidean h-functions near independence (#488)

- safety net for NA structure weights (#487)

- fix code qix quality issues (#486)

- fix `Vinecop::str()` (#484)

## vinecopulib 0.5.1 (November 25, 2019)

### BUG FIXES

- fix out of range bug for weighted TLL influence when sample size is small 
  (#479).

## vinecopulib 0.5.0 (November 25, 2019)

### NEW FEATURES

- modelling discrete variables with bivariate or vine copulas. (#454)

- selection of partially specified R-vine structures. (#457)

- convenience classes `DVineStructure()`/`CVineStructure()` for D- and 
  C-vine structures. (#464)

- new criterion for tree selection: `"joe"` corresponds to -log(1-r^2), 
  where r is the pairwise partial correlation. (#426)

- random sampling of R-vine structures. (#429)

- (de)serialization methods `to/from_ptree/json()` for `RVineStructure` 
  objects. (#435)

- some improvements in memory efficiency. (#460)

### BREAKING API CHANGES

- `Vinecop` ctors: interchanged order of `structure` and `pair_copulas`,
  removed unpopular versions, new argument `var_types`. (#465) 

- removed `tools_stats::simulate_uniform(n, d, seeds)` to avoid implicit 
  conversion. (#430)

- `calculate_npars()` becomes `get_npars()`. (#431)

- by default, `RVineStructure::get_struct_array()` and 
  `RVineStructure::struct_array()` objects return the structure array in the 
  original order (as opposed to natural order). An additional argument is 
  available to ask for the old behavior. (#437, #439)

- removed `TriangularArray<T>::operator[]` to access columns. 
  `TriangularArray`s are now stored row-major and provide a new constructor
  `TriangularArray<T>(std::vector<std::vector<T>> rows)`. (#433)

### BUG FIXES AND OTHER IMPROVEMENTS

- better support for 0-truncated structures. (#462)

- prevent 0/0 in normalization of `BicopFamily::tll` fits. (#463)

- use `std::shufle()` instead of `std::random_shuffle()` to remain\
  C+17-compliant. (#451)

- ensure consistency in manually created `Bicop(BicopFamily::tll, ...)`, 
  with fitted versions. (#446)

- fixed order of ranks in `to_pseudo_obs(.., "first")`. (#469)

- safer computation of multivariate normal cdf. (#475) 

## vinecopulib 0.3.2 (July 3, 2019)

### NEW FEATURES

- new `Vinecop::str()` method (#420)

- enhanced extensibility of `RVineStructure`, `Vinecop`, and 
  `VinecopSelector` classes and  (#419) 

### BUG FIXES

- fix interval adjustment for Brent parameter optimization (#414)

- clean up includes to improve build times (#412)

- better printing for tll family (#415)

- fix batches when `num_threads = 0` (#418)

## vinecopulib 0.3.1 (April 5, 2019)

### NEW FEATURES

- refactoring for enhanced extensibility of the class `Vinecop` (#407)

- add an `str` method to `RVineStructure` (#406) 

- simplify algorithms by reversing definition of natural order (#387)

- improve selection of truncation level (#373)

- add truncate methods for `TriangularArray`, `RVineStructure` and `Vinecop` 
  (#372)

### DEPRECATED FUNCTIONS

- `FitControlsVinecop` methods like `get_truncation_level()` are now 
  deprecated in favor of the shorter `get_trunc_lvl()` versions.

### BUG FIXES

- fix triangular array print method (#405)

- fix potential nan when using Kendall's tau inversion to fit (#403)

- stabilize clayton pdf close to independence (#402)

- fix warning-generating typos in the tests (#391)

- fix deprecated warnings from gtest (#390)

- initializer list constructor for `VinecopSelector` (#384)

- fix baseline criterion in `Bicop::select()` (#382)

- use the `trunc_lvl` of `vine_struct` in `select_families` (#380)

- fix incompatible size (#378)

- remove definitions of `pairwise_rho` and `pairwise_hoeffd` (#375)

- fix windows warnings (#371)

- use `std::log()` (#370)

## vinecopulib 0.3.0 (August 9, 2018)

### NEW FEATURES

- new function `Vinecop::rosenblatt()` for computing the Rosenblatt 
  transformation (#367).

- faster algorithms for nonparametric copulas based on bilinear interpolation
  (#357).

- refactor vine structures and related algorithms with triangular arrays to 
  improve efficience of truncated models (#347, #354, #365). 

- improve random number generation: allow for seeds and quasi-random 
  numbers (#342, #356).

- improved parallelization for fitting vine copula models (#338, #344).

- parallelized versions of many algorithms including pdf, cdf and simulation 
  (#339, #363).

- allow weights for observations (#336).

### BUG FIXES

- fix cdf of StudentBicop (#353).

- improve numerical stability (#345, #350).

- fix gcc-8 warning (#340).

## vinecopulib 0.2.8 (May 4, 2018)

### NEW FEATURES

- new getters for Kendall's tau (#319).

- log-likelihood as a new data member for AbstractBicop and Vinecop 
  (`loglik_`), initialized as NAN and set by fitting 
  routines like `fit` and `select` (#327).

- new getters for the log-likelihood (#327).

### BUG FIXES

- fix truncation of pdf values (#320).

- use increased search interval for parameter estimation when initial fit is 
  unreasonable (#322).

- ensure that boundaries are respected for Joe's `hinv` methods (#323).

- improve numerical stability by more restrictive parameter bounds for Joe 
  and BB7 copulas (#324, #325). 

- bandwidth adjustment for family `"tll"` (#326).

## vinecopulib 0.2.7 (March 1, 2018)

### NEW FEATURES

- new criterion for tree selection `"mcor"` (#309).

### BUG FIXES

- fix bandwidth scaling for family `"tll"`(#309).

## vinecopulib 0.2.6 (February 22, 2018)

### NEW FEATURES

- add checks for data in (0, 1) (#305).

- add scaling by `mcor` to estimate the bandwidth of `TllBicop` (#302) .

- add mBICV to select the truncation level and threshold (#304).

### BUG FIXES

- improve Windows build (#301, #302).

- fix `hoeffd` in `calculate_criterion` (#297).

## vinecopulib 0.2.5 (January 14, 2018)

### NEW FEATURES

- speed up vine copula algorithms by pre-computing information related to 
  the vine structure (#292).

- the selected threshold parameter can be returned from the `Vinecop` 
  object (#290).

### BUG FIXES

- fix storage order of pair copulas when structure is fixed (#289).

- fixed selection algorithm for threshold and truncation level (#290, #294,
  \#295).

## vinecopulib 0.2.4 (December 29, 2017)

### BUG FIXES

- adapt Vinecop's `simulate()` and `pdf()` to truncated vines (#279) 

- make bb8 lower bound ensure feasible computations in `parameters_to_tau()` 
  (#278 and #280)

- default initialize Rcout (#277).

## vinecopulib 0.2.3 (November 18, 2017)

### NEW FEATURES

- faster implementation of Archimedean pdfs (#274).

### BUG FIXES

- add safeguards for estimation of `Bicop`/`Vinecop` objects with 
  insufficient data (#273).

- fix segfault issue in completing a truncated vine fit (#272).

- make `par_method = "itau"` respect the parameter bounds (#271).

## vinecopulib 0.2.2 (November 9, 2017)

### NEW FEATURES

- allow `"loglik"` as selection criterion (#267).

### BUG FIXES

- make interpolation grid symmetric around (0.5, 0.5) again (#268).

## vinecopulib 0.2.1 (November 7, 2017)

### NEW FEATURES

- faster vine copula estimation and selection by parallelizing further 
  sub-routines (#259).

- enhanced cross-platform compatibility and addition of a `STRICT_COMPILER`
  option for gcc (#261).

- increased precision of maximum-likelihood estimators (#264).

### BUG FIXES

- made arguments of pairwise dependence measures consistent (#258).

- fixed `itau` estimation method for Frank copulas (only allowed for positive
  parameters) (#263).

## vinecopulib 0.2.0 (October 30, 2017)

### LIBRARY TYPE

- library is now header only by default (#246), with an option to compile it
  as a shared library (#249).

### DEPENDENCIES

- removed dependency on `NLopt` (#239).

### NEW FEATURES

- NA handling (#237, #238).

- parallelized selection/estimation of (pair-) copulas (#240).

- efficient storage and fitting of truncated vines (#248).

- Brent line search for (profile-) maximum-likelihood estimation of one-
  parameter families (#255).

- more restrictive parameter bounds for Archimedean families, ensuring their 
  numerical stability (#256).

### BUG FIXES

- error thrown whenever `Vinecop` or `Bicop` constructors are called with
  datasets containing a single row (#251).

- ensure `const` correctness of `Vinecop` and `Bicop` member functions (#225).

- made order of inverse Rosenblatt consistent for d = 2 and d > 2 (#232).

- fixed bug in interpolation near upper right corner (#233).

- interpolation grid is now symmetric around (0.5, 0.5) (#234).

- stabilized quadratic tll estimator near zero (#235).

- stabilized Archimedean pdfs (#256).

## vinecopulib 0.1.0 (August 23, 2017)

### NEW FEATURES

- read/write `Bicop` and `Vinecop` objects (#205) using 
  `boost::property_tree::ptree` with `to_ptree()`, `to_json()`, and 
  constructors taking `const char   *filename` or a 
  `boost::property_tree::ptree` for both classes.

- sparse selection of vine copulas (#206) using new data members in 
  `FitControlsVinecop`:
      _ `bool select_truncation_level` whether the truncation is selected 
       automatically.
      _ `bool select_threshold` whether the threshold parameter is selected 
       automatically.
      \* `double threshold` sets a fixed threshold parameter.

- local likelihood estimators (#216) have been implemented by refactoring the 
  `tll0` family into a more general `tll` family, where approximations of 
  degrees zero, one and two can be fitted by setting the new 
  `std::string nonparametric_method` data member of `FitControlsBicop` 
  respectively as `constant`, `linear` and `quadratic` (default).

- Kendall's tau (#211) and normalization (#215) for kernel estimators.

- support for clang compiler on linux (#201, #202, #203).

- option to omit R-vine matrix check in `Vinecop` constructors (#198).

### BUG FIXES

- replacing throw `std::string` with throw `std::runtime_error` in 
  `tools_opimization.cpp` (#204).

- ensure valid starting parameters in `Bicop::fit()` (#209, #210).

- fix appveyor and travis problems (#208, #212, #213).

## vinecopulib 0.0.3 (June 7, 2017)

### NEW FEATURES

- new functions `Bicop::cdf()` and `Vinecop::cdf()` for evaluating the
  cumulative distribution function of bivariate and vine copulas (#177, #189).

- the constructor of the `RVineMatrix` class now checks whether it is
  provided with a valid R-vine matrix (#192).

- extended documentation to build the library under Windows (#188).

- extended continuous integration tests for Windows (#150, #169).

### BUG FIXES

- vinecopulib.dll is installed to `lib/` instead of `bin/` (#149).

- more pleasing and portable formatting of error messages (#147, #156, #159,
  \#165).

- fixed bugs in `Bicop::select()` caused by `0`s and `1`s or unsufficient
  data (#173, #180).

- fixed compatibility issue with CMake 3.8 (#167).

- fixed uninitialized memory issues on Windows (#169).

## vinecopulib 0.0.2 (March 31, 2017)

### MAJOR CHANGES

- all `tools_xxx` namespaces are no sub-namespaces of `vinecopulib` (#130).

- header files are encapsulate in an addtional `vinecopulib/` folder, i.e.,
  `include/vinecopulib/subdir/file.hpp` (#126).

- removed abitility to extract the git revision (#124).

- new header `misc/tools_interface.hpp` where interface-specific behavior
  can be defined (for example, a custom version of `std::cout`) (#136).

### BUG FIXES

- fix `mat.array() = 0` error on some compilers (#131).

- add missing `<exception>` header (caused errors on not fully C++11
  compliant compilers, #139).

## vinecopulib 0.0.1 (March 29, 2017)

Initial release.
