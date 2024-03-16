# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: xia0er <xia0er@gmail.com>

pkgname=python-pymc
_pkgname=${pkgname#python-}
pkgver=5.11.0
pkgrel=1
pkgdesc="Markov chain Monte Carlo for Python"
arch=(any)
url="https://github.com/pymc-devs/pymc"
license=(MIT)
depends=(
  ipython
  python
  python-arviz
  python-cachetools
  python-cloudpickle
  python-fastprogress
  python-graphviz
  python-matplotlib
  python-networkx
  python-numpy
  python-pandas
  python-pytensor
  python-pytest
  python-scipy
  python-typing_extensions
  python-xarray
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('96d137933542cfd133154956969625d40780f9e29ad00904c206170490fac2b5')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  local ignore_test_args=(
    # Requires https://github.com/pyro-ppl/numpyro which is not yet packaged.
    --ignore=tests/sampling/test_jax.py
    --ignore=tests/sampling/test_mcmc_external.py

    # Requires https://aur.archlinux.org/packages/python-numdifftools which
    # currently is broken.
    --ignore=tests/logprob/test_transform_value.py

    # Error during test collection.
    --ignore=tests/backends/test_mcbackend.py

    # Most time-consuming test files, ignore these to make test duration more
    # reasonable.
    --ignore=tests/backends/test_arviz.py
    --ignore=tests/distributions/test_continuous.py
    --ignore=tests/distributions/test_discrete.py
    --ignore=tests/distributions/test_distribution.py
    --ignore=tests/distributions/test_mixture.py
    --ignore=tests/distributions/test_multivariate.py
    --ignore=tests/distributions/test_timeseries.py
    --ignore=tests/distributions/test_transform.py
    --ignore=tests/distributions/test_truncated.py
    --ignore=tests/gp/test_cov.py
    --ignore=tests/gp/test_gp.py
    --ignore=tests/gp/test_hsgp_approx.py
    --ignore=tests/logprob/test_mixture.py
    --ignore=tests/logprob/test_tensor.py
    --ignore=tests/logprob/test_transforms.py
    --ignore=tests/model/test_core.py
    --ignore=tests/sampling/test_forward.py
    --ignore=tests/sampling/test_mcmc.py
    --ignore=tests/sampling/test_parallel.py
    --ignore=tests/step_methods/hmc/test_nuts.py
    --ignore=tests/step_methods/test_metropolis.py
    --ignore=tests/test_func_utils.py
    --ignore=tests/test_math.py
    --ignore=tests/test_pytensorf.py
    --ignore=tests/variational/test_inference.py
  )
  local deselect_test_args=(
    # Fails due to:
    # DeprecationWarning: np.find_common_type is deprecated.  Please use `np.result_type` or `np.promote_types`.
    --deselect=tests/backends/test_arviz.py::TestDataPyMC::test_autodetect_coords_from_model

    # Fails due to:
    # assert (2, 50) == (2, 50, 20)
    --deselect=tests/backends/test_arviz.py::TestDataPyMC::test_multivariate_observations

    # Fails due to:
    # pymc.logprob.utils.ParameterValueError or AssertionError
    --deselect=tests/distributions/test_mixture.py::TestMixtureSameFamily::test_with_multinomial
    --deselect=tests/distributions/test_multivariate.py::TestMatchesScipy::test_multinomial
    --deselect=tests/distributions/test_multivariate.py::TestMatchesScipy::test_multinomial_invalid_value
    --deselect=tests/distributions/test_multivariate.py::TestMatchesScipy::test_multinomial_vectorized
    --deselect=tests/distributions/test_multivariate.py::TestMoments::test_multinomial_moment

    # Fails due to:
    # assert array(nan) >= 0
    --deselect=tests/distributions/test_multivariate.py::TestMatchesScipy::test_multinomial_zero_probs
  )
  pytest "${ignore_test_args[@]}" "${deselecte_test_args[@]}"
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
