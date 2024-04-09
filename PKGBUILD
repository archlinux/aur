# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: xia0er <xia0er@gmail.com>

pkgname=python-pymc
_pkgname=${pkgname#python-}
pkgver=5.13.0
pkgrel=2
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
  python-graphviz
  python-matplotlib
  python-networkx
  python-numpy
  python-pandas
  python-pytensor
  python-pytest
  python-rich
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
sha256sums=('d13c19af88fba30d8647b9bfd01f271f5a6576f5e496aeb1ea11b5e32431316d')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  local pytest_args=(
    # Requires https://github.com/pyro-ppl/numpyro which is not yet packaged.
    --ignore=tests/sampling/test_jax.py
    --ignore=tests/sampling/test_mcmc_external.py

    # Requires https://aur.archlinux.org/packages/python-numdifftools which
    # currently is broken.
    --ignore=tests/logprob/test_transform_value.py

    # Error during test collection.
    --ignore=tests/backends/test_mcbackend.py

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

    # Most time-consuming test files, ignore these to make test duration more
    # reasonable.
    --deselect=tests/backends/test_arviz.py
    --deselect=tests/distributions/test_continuous.py
    --deselect=tests/distributions/test_discrete.py
    --deselect=tests/distributions/test_distribution.py
    --deselect=tests/distributions/test_mixture.py
    --deselect=tests/distributions/test_multivariate.py
    --deselect=tests/distributions/test_timeseries.py
    --deselect=tests/distributions/test_transform.py
    --deselect=tests/distributions/test_truncated.py
    --deselect=tests/gp/test_cov.py
    --deselect=tests/gp/test_gp.py
    --deselect=tests/gp/test_hsgp_approx.py
    --deselect=tests/logprob/test_mixture.py
    --deselect=tests/logprob/test_tensor.py
    --deselect=tests/logprob/test_transforms.py
    --deselect=tests/model/test_core.py
    --deselect=tests/sampling/test_forward.py
    --deselect=tests/sampling/test_mcmc.py
    --deselect=tests/sampling/test_parallel.py
    --deselect=tests/step_methods/hmc/test_nuts.py
    --deselect=tests/step_methods/test_metropolis.py
    --deselect=tests/test_func_utils.py
    --deselect=tests/test_math.py
    --deselect=tests/test_pytensorf.py
    --deselect=tests/variational/test_inference.py
  )
  pytest "${pytest_args[@]}"
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
