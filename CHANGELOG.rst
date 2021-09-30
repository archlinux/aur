Master Branch
=============

Version 4.3.3 (2021-05-26)
==========================

FIXED:
  * Compatibility with `numpoly`: Bug workaround in polynomial division.
    Only affects numpoly v1.2.3 and generating polynomials with `normed=True`.

Version 4.3.2 (2021-05-26)
==========================

FIXED:
  * Compatibility with `numpoly`: Update string key access to `ndpoly` objects.

Version 4.3.1 (2021-03-18)
==========================

Refactoring `orthogonal -> expansion` module.

ADDED:
  * Dedicated classical orthogonal expansion schemes:
    `chaospy.expansion.{chebyshev_1,chebyshev_2,gegenbauer,hermite,jacobi,laguerre,legendre}`
CHANGED:
  * Function renames:
    `chaospy.{orth_ttr,orth_chol,orth_gs,lagrange_polynomial} ->
    chaospy.expansion.{stieltjes,cholesky,gram_schmidt,lagrange}`
  * Docs update.

Version 4.3.0 (2021-01-20)
==========================

Refactoring `quadrature` module.

ADDED:
  * `chaospy.quadrature.fejer_1` is added.
  * Dedicated classical quadrature schemes:
    `chaospy.quadrature.{chebyshev,gegenbauer,hermite,jacobi,laguerre,legendre}`
CHANGED:
  * Bound checks for the triangle distribution. (Thanks to @yoelcortes.)
  * Refactored hypercube quadrature to common backend. This gives lots of flags
    like `seqments` and
  * Function renames:
    `chaospy.quad_{clenshaw_curtis,discrete,fejer,gaussian,grid,gauss_lengendre,gauss_kronrod,gauss_lobatto,gauss_patterson,gauss_radau} ->
    chaospy.quadrature.{clenshaw_curtis,fejer_2,gaussian,grid,legendre_proxy,kronrod,lobatto,patterson,radau}`
  * Patterson growth rule changed from `0, 3, 7, ...` to `0, 1, 2, ...` but
    maps backwards. Defaults to not have growth parameter, as setting it false
    makes no sense.
  * Renamed: `chaospy.generate_sparse_grid -> chaospy.quadrature.sparse_grid`
REMOVED:
  * Genz-Keister quadrature `quad_genz_keister` is deprecated as it does not
    fit the `chaospy` scheme very well.

Version 4.2.7 (2021-05-11)
==========================

ADDED:
  * Support for approximate multivariate raw moments.

Version 4.2.6 (2021-05-10)
==========================

FIXED:
  * `TruncNormal` is a `ShiftScaleDistribution`, not a `J` operator.

Version 4.2.5 (2021-04-16)
==========================

FIXED:
  * Bugfix: `sparse=True growth=None` should se `growth=True`, but didn't this
    means that rules that require growth rules to be nested, i.e.
    `clenshaw_curtis, fejer, discrete, newton_cotes` were not benefiting
    fully from sparse-grid.

Version 4.2.4 (2021-02-23)
==========================

FIXED:
  * Correct bounds for Mean-Covariance distributions.

Version 4.2.3 (2021-01-20)
==========================

FIXED:
  * Correct triangle repr.

Version 4.2.2 (2020-12-07)
==========================

ADDED:
  * Increase the number of dimensions supported in Sobol sequence to 1111.
  * Lower level override `get_*_parameters` functions to differentiate between
    density/fwd/inv, mom, ttr, and lower/upper.
  * New `allow_approx` flag in `Distribution.pdf`.
  * More docs and tests.
  * Support for bibliography in docs.
CHANGED:
  * Updated Clenshaw-Curtis and Fejér algorithm which scales much better.
  * More aggressive sample use in `approximate_moment` as bottleneck was the
    quadrature (Clenshaw-Curtis and Fejér).
  * Better support for density approximation. Allow for more contexts by
    weaving a full density history.
  * Documentation update.
FIXED:
  * Wrappers distribution no longer ignores wrapped distribution during
    dependency declaration. Ignoring them have in some cases caused some
    variables not to be declared correctly.

Version 4.2.1 (2020-11-24)
==========================

FIXED:
  * Bugfix in rounding for discrete distributions.
  * Bugfix in rule for when to round discrete variables.

Version 4.2.0 (2020-11-23)
==========================

ADDED:
  * `include_axis_dim` flag added to `Distribution.sample` to force the
    inclusion of extra dimension. (Currently first dimension is omitted is
    `len(dist) == 1`.)
  * Code of conduct and contribution descriptions in repo root.
  * Tutorial for doing sequential polynomial chaos kriging.
CHANGED:
  * `chaospy.E_cond` changed to accept simple polynomials as second argument,
    allowing for e.g. `chaospy.E_cond(q0*q1, q0, dist)` which can be
    interpreted as "expectation of `q0*q1` given `q0` with respect to `dist`".
  * Full refactorization of the documentation.
  * Updates `numpoly` to version 1.1.0. (some small breaking changes).
FIXED:
  * Bugfixes to `chaospy.Spearman`
REMOVED:
  * Deprecated `report_on_exception`. Caused recursion problems, and only a
    semi-useful diagnostic tool to begin with.
  * No more support for Python 3.5. This allows the poetry install to use
    newer version of `numpy` and `scipy`. (This relates to poetry install, so
    working in py35 might still be possible in practice.)

Version 4.1.1 (2020-11-13)
==========================

ADDED:
  * `include_axis_dim` flag added to `Distribution.sample` to force the
    inclusion of extra dimension. (Currently first dimension is omitted is
    `len(dist) == 1`.)
CHANGED:
  * `chaospy.E_cond` changed to accept simple polynomials as second argument,
    allowing for e.g. `chaospy.E_cond(q0*q1, q0, dist)` which can be
    interpreted as "expectation of `q0*q1` given `q0` with respect to `dist`".
  * Bugfixes to `chaospy.Spearman`
  * Updates to the documentation.
REMOVED:
  * Deprecated `report_on_exception`. Caused recursion problems, and only a
    semi-useful diagnostic tool to begin with.
  * No more support for Python 3.5. This allows the poetry install to use
    newer version of `numpy` and `scipy`.

Version 4.1.0 (2020-11-05)
==========================

Refactored `chaospy.quadrature.recurrence` -> `chaospy.recurrence`.

CHANGED:
  * `chaospy.constructor` removed in favor for `chaospy.UserDistribution`.
  * Bugfix: `chaospy.InverseGamma` moments needed to be reciprocal.
  * Increased range on distributions: `StudentT`.
  * Moved submodule `chaospy{.orthogonal->}.recurrence`.
  * Stieltjes method get common interface `chaospy.stieltjes` which uses
    analytical TTR if present, and approximation if not.
  * Refactor `discretized_stieltjes` to be an iterative method with
    tolerance criteria instead of brute forced. Also added max iterations and
    scaling.
  * Flag: Default `recurrence_algorithm` default changed to `stieltjes` (as
    it covers both `analtical` and discretized Stieltjes).
  * Discretization default in Lanczos and Stieltjes changed from `fejer` to
    `clenshaw_curtis` as edge evaluation is better handled these days, and the
    latter is better for when edges are finite.
REMOVED:
  * `chaospy.basis` and `chaospy.prange` (which was superseded by
    `chaospy.monomial` in June).
  * Removal of "analytical" TTR where it is approximated: `Triangle`.
  * `chaospy.chol` modules and the Cholesky functions: `bastos_ohagen`,
    `gill_murry_wright` and `schnabel_eskow`. `gill_king` moved to
    `chaospy.orthogonal.cholesky` as it is used by `orth_chol`.
  * Flag: `accuracy` deprecated in favor for `tolerance`.

Version 4.0.2 (2020-10-30)
==========================

CHANGED:
  * `lower > upper` illegal for all `LowerUpperDistribution` and `Trunc`.
  * `scale <= 0` illegal for all `ShiftScaleDistribution`.
  * Add epsilon buffer to all quadrature rules that evaluate at the edges.
  * `numpoly` update to version 1.0.8.

Version 4.0.1 (2020-10-26)
==========================

Release!

ADDED:
  * Gaussian Mixture Model: `GaussianMixture`.
  * Tutorial for how to use `scikit-learn` mixture models to fit a model, and
    `chaospy` to generate quasi-random samples and orthogonal polynomials.
CHANGED:
  * `chaospy.Trunc` updated to take both `lower` and `upper` at the same time.
REMOVED:
  * `chaospy.SampleDist` removed in favor of `chaospy.GaussianKDE`.

Version 4.0-beta3 (2020-10-22)
==============================

Additive recursion sampler.

ADDED:
  * Support for additive recursive sampling scheme.
  * Tutorial for Monte-Carlo now includes compare of difference sampling
    schemes.
CHANGED:
  * Bugfix to antithetic variate.

Version 4.0-beta2 (2020-10-21)
==============================

Mv-KDE support!

ADDED:
  * Added support for multivariate kernel density estimation distribution
    `GaussianKDE`.
  * Tutorial for KDE.
CHANGED:
  * Default tolerance for the accuracy in approximate inverse lowered from
    `10^-5` to `10^-12`.
  * Lots of distribution have fixes such that `dist.inv([0, 1])` is now allowed
    in general.
  * Update to lots of docs to include example with `dist.inv([0, 1])`.
  * Update `nbval` config to be more relaxed during tests.

Version 4.0-beta1 (2020-10-09)
==============================

Distribution operations are now all one-dimensional. One pass per dimension.

ADDED:
  * New `report_on_error` decorator to get more understandable error output.
  * New helper functions: `format_repr_kwargs`, `init_dependencies`,
    `declare_dependencies`, `check_dependencies`.
  * New intermediate distribution baseclasses:
    `ItemDistribution`, `LowerUpperDistribution`, `MeanCovarianceDistribution`,
    `OperatorDistribution`, `ShiftScaleDistribution`.
  * New basic distribution: `InverseGamma`.
  * New error type of error `UnsupportedFeatureError` to differentiate illegal
    operations (covered by `StochasticallyDependentError`) and unsupported
    features.
  * Lots of new tests.
CHANGED:
  * Lots and lots of positional `idx` arguments everywhere to indicate the
    dimensions worked on. Except for `_mom` which is kept as is.
  * Adding consistent baseclass naming convention:
    `Copula{->Distribution}`, `Mul->Multiply`, `Neg->Negative`,
    `DistributionCore->SimpleDistribution`.
  * `Qoi_Dist` will no longer returns a numpy array in the multivariate case.
    This is because `Distribution` no play will as a numpy object type.
  * Changes to cache system:
    * Cache content changed from `Dict[Distribution, ndarray]` to
      `Dict[Distribution, Tuple[ndarray, ndarray]]` to store both inputs and
      outputs for each calculations.
    * backend function `_value` replaced with `_cache` for consistency.
    * Backend interface `_get_value` replaced with `_get_cache_1` and
      `_get_cache_2`. For former is new, the latter is a renaming.
  * `Iid` is changed from being a function wrapper to a subclass wrapper,
    allowing once again `isinstance(dist, Iid)`.
REMOVED:
  * Deprecating topological soring in `J`, as this is now handled by the
    evaluation order.
  * Old function interfaces `add, mul, neg, trunk, trunc, pow`.
  * Comparison operators `<`, `<=`, `>` and `=>` for distributions. These were
    used as syntactic sugar referencing `chaospy.Trunc`. This to support `==`
    operator.

Version 4.0-alpha2 (2020-09-12)
===============================

Adding rotation: changing dist backend.

ADDED:
CHANGED:
  * Baseclass distribution baseclass refactoring:
      * Split old `Dist` into two: Abstract baseclass `Distribution` and
        convenience structure `DistributionCore`.
      * Cleaned up `__init__` structured to be more standardized.
      * Much improved REPR handle.
      * standardized `__len__`.
      * Lots more pre-flight checks for distribution integrity.
      * Simplification and standardization of `distributions.operators`.
      * Better recursive caching of values during evaluations.
      * Some hierarchy changes.
  * Tiny changes in argument signature for some distribution. Same arguments,
    but some change in names or order to standardize. These changes affect:
    `Angelit`, `Burr`, `Cauchy`, `ChiSquared`, `F`, `FoldedNormal`,
    `GeneralizedExtreme`, `HyperbolicSecant`, `Levy`, `LogWeibull`, `Logistic`,
    `MvStudentT`, `Pareto1`, `Pareto2`, `PowerLogNormal`, `PowerNormal`,
    `StudentT`,
REMOVED:
  * `chaospy.distributions.evaluation` is removed in favor for method on the
    `Distribution` class.
  * `DependencyError` deprecated in favor of `StochasticallyDependentError`.
  * `matmul` operator is in practice an really odd duckling that is highly
    incompatible with the rotation idea. If linear map is needed, use
    `MeanCovariance`.

Version 4.0-alpha1 (2020-09-04)
===============================

Adding rotation: the fundamentals.

ADDED:
  * Property for checking for dependencies: `Dist.stochastic_dependent`.
  * Lots of illegal probability distribution configuration that would cause
    trouble during execution are now caught earlier with an appropriate
    error.
  * Logging of samples out-of-bound for Dist methods:
    `pdf`, `cdf`, `inv`, `fwd`.
  * `Dist.pdf` get the extra flag `decompose` to split density into parts
    (like `inv` and `fwd` does by default.) Should work with all
    distribution, with a few exception. (MvLogNormal comes to mind.)
  * New `LocScale` baseclass for all generic distributions with location and
    and covariance structure.
  * Lots of new tests.
CHANGED:
  * New and improved dependency system based on underlying variable
    declaration.
  * Some probability distribution boundaries moved from hardcoded to
    automatically detected.
  * Update `Iid` to not be `J` subclass.
  * Test cases for the new `LocScale` baseclass: `MvNormal` and `Alpha`.
REMOVED:
  * Precedence order system. Was not ready yet, and a new one is being made
    with the rotation system.

Version 3.3.8 (2020-08-10)
==========================

FIXED:
  * Correct length for multivariate binary operators.

Version 3.3.7 (2020-08-09)
==========================

CHANGED:
  * `numpoly` update to version 1.0.6.

Version 3.3.6 (2020-07-23)
==========================

ADDED:
  * Support for quadrature dispatching for `Mul`, `Add` and (independent) `J`.

CHANGED:
  * Refactor approximate_moment:
    * Remove unused antithetic variate. (Really never used.)
    * Remove redundant support for multiple exponents at once. In practice only
      one is called at the time anyway.
    * Adding buffering for both quadrature and results, so to reduce needed
      computation for recursive methods.
    * New order default: 1000 -> 1000/log2(len(dist)+1)
      About the same for lower dimensions, but scales better with higher
      dimensions.
  * Update requirements to include numpy.

Version 3.3.5 (2020-07-13)
==========================

CHANGED:
  * Refactor discrete distribution:
    * Allowing "offset" (up to 0.5 on each side), making all discrete
      distributions piece-wise constants.
    * Use linear interpolation in `dist.fwd` and `dist.inv` between the edges,
      making them piece linear function.
    * `dist.cdf` adjusted 0.5 to the right to replicate old behavior.
    * Update the two implemented discrete distributions `DiscreteUniform` and
     `Binomial`.

Version 3.3.4 (2020-07-09)
==========================

ADDED:
  * Added changelog (the file you currently are reading).
  * Support for polynomial saving to and loading from disk.

CHANGED:
  * Refactor descrete distributions to work better with quadrature.
  * `numpoly` update to version 1.0.5.

FIXED:
  * Bugfix: Poly-division with large relative error caused infinity-loops.

Version 3.3.3 (2020-06-29)
==========================

CHANGED:
  * Move `chaospy/tutorial -> chaospy/docs/tutorials`.
  * Use nbsphinx to integrate notebooks straight into the RTD docs.
  * Renamed `chaospy/{doc -> docs}`.
  * Include numpoly documentation content directly in toctree.
  * `numpoly` update version 1.0.3
  * Chaospy logger now capture Numpoly as well.
  * Aligning Numpoly properly, making a wrapper redundant.

REMOVED:
  * Announcing deprecation of `chaospy.basis` and `chaospy.prange` in favor
    of `chaospy.monomial`.
  * Deprecating `chaospy.setdim` in favor for `numpoly.set_dimensions`.

Version 3.3.2 (2020-06-16)
==========================

ADDED:
  * Add Joe-copula back into the fold.
  * Add `chaospy.example` to simplify the Jupyter notebook tutorials creation.

CHANGED:
  * Remove CircleCI `build-cache` system in favor of simpler linear builds.
    * Reduce checks to 2.7 and 3.8. Anything between is assumed to be covered
      by the two.
  * Clean up sensitivity analysis tools.
  * Clean up copula docs.
  * Move lots of doc examples from .rst to .ipynb.

REMOVED:
  * Remove `Sens_*_nataf` as they were a one-shot project for a paper and no
    longer work.
  * Deprecate old Archemedean base copula

Version 3.3.1 (2020-06-09)
==========================

CHANGED:
  * Switch `numpoly.bindex` with new `numpoly.glexindex`.

REMOVED:
  * Removing unused Bertran functions.
  * Deprecating old Distribution names (which have been announce for over a year
    through warning messages)

Version 3.3.0 (2020-06-08)
==========================

ADDED:
  * Added `chaospy.orthogonal.frontend:generate_expansion` as an one stop
    expansion generation function.
  * Add tag-check when deploying using tags.
  * Add logging which activates on env `CHAOSPY_DEBUG=1`.
    Log to file with env `CHAOSPY_LOGFILE=/path/to/file`
  * Added *Program Evaluation and Review Technique* (PERT) distribution.
  * Adding support for `Dist.__matmul__`
    (which obviously does nothing in python 2).
  * Adding tests to the *hard-to-get-right* sub-module:
    `chaospy.distributions.operators`.
  * Added LRU cache to some quadrature schemes.
  * Added segments to Newton-Cotes, Fejer and Clenshaw-Curtis
    (as this is recommended to have to discretized Stieltjes).
  * Added experimental Jupyter notebooks with user tutorials/recipes
    `GITROOT/tutorial`
  * Gumbel and Clayton copulas get analytical recursive Rosenblatt
    transformations.

CHANGED:
  * Update `numpoly` to version 0.3.0.
    * Replace explicit numpoly import, with an implicit one with a
      smart-wrapper.
    * Docs updated with new polynomial string representation order.
  * Update to documentation.
  * Replace sample and quadrature scheme name from one letter
    ["G", "E", "C", "H", ...], to new full name strings:
    ["gaussian", "legendre", "clenshaw-curtis", "halton", ...].
    (Old style still works, but is undocumented.)
  * Increase quadrature sample rate 100->200 when doing discretized Stieltjes
    to increase accuracy (at the computational cost).
  * Increased sample rate for approximate inverse (used when inverse is
    missing), increasing accuracy at extra computational cost.
  * New style Archemedean copula.
  * Refactor `chaospy.distributions.operators` to become less messy.
  * Some adjustment to the expansion functions to align with the new frontend.
  * Update lagrange to use `numpoly.bindex` in the backend.
  * Use `graded: bool` and `reverse: bool` as a replacement for `sort: str =
    "GRI"`:
    * The `"I"` in `"GRI"` is deprecated: It can always be achieved with
      `values = values[::-1]`, so it serves little purpose.
    * The `"R"` was implemented backwards. `R` present is equivalent with
      `reverse=False`.
    * `sort` still works, but raises an warning about future deprecation.
    * Using one letter strings is less readable, and needs to be removed.
      Splitting them up, simplifies documentation.

REMOVED:
  * Deprecating copulas Frank, Joe and Ali-Mikhail-Haw, as their accuracy is
    not good enough.
  * Remove really old tutorial stuff not longer in use.

Version 3.2.1 (2020-02-11)
==========================

FIXED:
  * Bugfix for `evaluate_lower` and `evaluate_upper` for operators like
    addition, multiply, power, etc.
  * Fix to `interpret_as_integer` of joint distribution
    (now covering mixed content).

Version 3.2.0 (2020-02-10)
==========================

ADDED:
  * Added `chaospy.__version__`

CHANGED:
  * Upper and lower methods:
    * Replace `Dist.bnd` with `Dist.lower` and `Dist.upper` to have better
      control.
    * Issue future deprecation warning if `Dist._bnd` is used.
    * Deprecate `chaospy.distributions.approximation:find_interior_point` as
      its use falls away with the new methods.
    * Add new `chaospy.distributions.evauation.bound:evaluate_lower` and
      `evaluate_upper`
  * Fix to `interpret_as_integer` of joint distribution with discrete
    components.

REMOVED:
  * Deprecated trigonometric distribution transformations, as the were hard to
    transfer over, undocumented and likely not used.

Version 3.1.1 (2020-01-10)
==========================

CHANGED:
  * `numpoly` version 0.1.6.

Version 3.1.0 (2019-12-29)
==========================

CHANGED:
  * `numpoly` introduced, version 0.1.4:
    * Replacing backend for polynomial handle with `numpoly`, leaving just a
      compatibility wrapper.
    * Refactor descriptive to utilize new backend
    * Update all docstring containing a polynomial as the string representation
      has changed.
    * Declare `chaospy.Poly` as soon-to-be deprecated
  * Replace setuptools+pipenv for installation and development management to
    poetry for both
  * Introduce CircleCI build-cache step.
  * Distribution update:
    * Added `Dist.interpret_as_integer` to better support discrete
      distributions.
    * Update lots of method docs in `chaospy.distributions.collection` to look
      better.

Version 3.0.9 (2019-08-25)
==========================

CHANGED:
  * Making a logger.warning into logger.info (as requested by user).

Version 3.0.8 (2019-08-25)
==========================

ADDED:
  * Added support for `openturns` Distributions (thanks Régis Lebrun).
  * Added "Related Projects" section to root README with thanks and shout-outs.
  * Added discrete distributions: Binomial, DiscreteUniform.
  * Added recipe for stochastic dependent distributions:
    `doc/recipes/dependent.rst`

CHANGED:
  * Moved external interfaces to new submodule: `chaospy.external`:
    SampleDist (KDE), OTDistribution (OpenTURNS), scipy_stats.
  * Update Chaospy logo.

Version 3.0.7 (2019-08-11)
==========================

CHANGED:
  * Replace `chaospy.bertran.operators.bertran_indices` with
    `chaospy.bertran.bindex`:
      * Faster execution by using more `numpy` for heavy lifting
  * Moved `chaospy.{quad -> quadrature}` to finalize the refactor from v3.0.6.
  * Documentation polish to `chaospy.quadrature`.

FIXED:
  * Bugfixes in handling of three-terms-recursion

REMOVED:
  * Remove `chaospy.quad.collection.probabilitic` as it is much easier to
    implement from the user side.

Version 3.0.6 (2019-07-26)
==========================

ADDED:
  * Added license to setup.py
  * New quadrature rules (thanks to Nico Schlömer):
    Gauss-Lobatto, Gauss-Kronrod, Gauss-Radau, Newton-Cotes.

CHANGED:
  * Update CircleCI to test for Python versions 2.7.16, 3.6.8 and 3.7.3
  * Update dependencies.
  * Refactored `chaospy.quadrature`:
    * Standardize quadrature interface.
    * Lots of new docs.
  * Move version number `chaospy.{version -> __init__}`.

REMOVED:
  * Deprecating `chaospy.distributions.collection.raised_cosine` as `hyp1f2` is
    no longer supported by `scipy`.
  * Removing local `set_state` for Sobol indices and instead rely on
    `numpy.random`'s random seed.

Version 3.0.5 (2019-06-17)
==========================

ADDED:
  * Added new method `Dist._range` to override the lower and upper bound
    calculations on some distributions.
  * Added readme to setup.py

CHANGED:
  * Adding caching to some of the functionality in `chaspy.bertran`
  * Use new cached functions to improve on raw statistical moments of
    multivariate Gaussian and multivariate Student-T distributions.
  * Update polynomial output, as update to Bertran changes a few things in str
    handle.

Version 3.0.4 (2019-02-20)
==========================

ADDED:
  * Adding `chaospy.distributions.evauation` submodule to deal with graph
    resolution.
  * Added CircleCI tests for Python 2.7.15

CHANGED:
  * Update CircleCI Python {3.6.2 -> 3.7.1}
  * Some adjustments added to support Python 2.

REMOVED:
  * Remove dependency to `networkx` (as `evaluation` now does this task).
  * Deprecating `chaospy.distributions.cores` (as each distribution are now
    locally defined in `chaospy.distributions.collection`)

Version 3.0.3 (2019-02-10)
==========================

FIXED:
  * Fixes to CircleCI testing.

Version 3.0.2 (2019-02-09)
==========================

ADDED:
  * Sparse segmentation function `chaospy.bertran.sparse:sparse_segment`

CHANGED:
  * Move install source {ROOT/src/chaospy -> ROOT/chaospy}
  * Documentation update (mostly `chaospy.orthogonal`).

REMOVED:
  * Deprecated `cubature` module; Does not work with the chaospy v3, and is hard
    to maintain.

Version 3.0.1 (2019-01-28)
==========================

CHANGED:
  * Update install dependencies to newest version
  * Refactor documentation
    * Update Sphinx configuration to newest version
    * Restructured the documentation a bit to make more sense with the new
      code.
    * Added some extra docs here and there.

Version 3.0.0 (2019-01-16)
==========================

ADDED:
  * Added Fejer quadrature

CHANGED:
  * Full refactor of the `chaospy.dist` submodule:
    * Move: `chaospy.dist -> chaospy.distributions`
    * Deprecate `chaospy.distributions.graph` in favor of new
      `chaospy.distributions.evaluation` which will not depend on `networkx`
      and should be easier to maintain.
    * Move distributions from the two files `distributions.{cores,collection}`
      to the folder `distributions.collection`, where each file now is one core
      and one (or more) wrapper(s).
    * Rename some old distributions; Kept the old ones for now, but they issue
      deprecation warnings.
    * Split `distributions.copulas.collection` into individual components.
    * Tests distribution using black-list instead of current white-list system.
    * Rewritten a lot of documentation.
  * Replace absolute import paths with relative ones.
  * Refactor `chaospy.descriptives` to look better docs and code wise.
  * Adapt to Python 2+3 support.
  * Turn on automatic logging for warnings and upwards
