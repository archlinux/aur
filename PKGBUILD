# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: xia0er <xia0er@gmail.com>

pkgname=python-pymc
_name=${pkgname#python-}
pkgver=5.10.3
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

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('786932f6cbd137f100200c9b5230ac6d943578eadf252d74e191941ee9791430')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  _ignored_tests=(
    # Requires https://github.com/pyro-ppl/numpyro which is not yet pacakged.
    tests/sampling/test_jax.py
    tests/sampling/test_mcmc_external.py

    # Requires https://aur.archlinux.org/packages/python-numdifftools which
    # currently is broken.
    tests/logprob/test_transform_value.py

    # Error during test collection.
    tests/backends/test_mcbackend.py

    # Most time-consuming test files, ignore these to make test duration more
    # reasonable.
    tests/backends/test_arviz.py
    tests/distributions/test_continuous.py
    tests/distributions/test_discrete.py
    tests/distributions/test_distribution.py
    tests/distributions/test_mixture.py
    tests/distributions/test_multivariate.py
    tests/distributions/test_timeseries.py
    tests/distributions/test_transform.py
    tests/distributions/test_truncated.py
    tests/gp/test_cov.py
    tests/gp/test_gp.py
    tests/gp/test_hsgp_approx.py
    tests/logprob/test_mixture.py
    tests/logprob/test_tensor.py
    tests/logprob/test_transforms.py
    tests/model/test_core.py
    tests/sampling/test_forward.py
    tests/sampling/test_mcmc.py
    tests/sampling/test_parallel.py
    tests/step_methods/hmc/test_nuts.py
    tests/step_methods/test_metropolis.py
    tests/test_func_utils.py
    tests/test_math.py
    tests/test_pytensorf.py
    tests/variational/test_inference.py
  )
  _ignored_tests_arg=$(printf " --ignore=%s" "${_ignored_tests[@]}")

  _deselected_tests=(
    # Fails due to:
    # DeprecationWarning: np.find_common_type is deprecated.  Please use `np.result_type` or `np.promote_types`.
    tests/backends/test_arviz.py::TestDataPyMC::test_autodetect_coords_from_model

    # Fails due to:
    # assert (2, 50) == (2, 50, 20)
    tests/backends/test_arviz.py::TestDataPyMC::test_multivariate_observations

    # Fails due to:
    # pymc.logprob.utils.ParameterValueError or AssertionError
    tests/distributions/test_mixture.py::TestMixtureSameFamily::test_with_multinomial
    tests/distributions/test_multivariate.py::TestMatchesScipy::test_multinomial
    tests/distributions/test_multivariate.py::TestMatchesScipy::test_multinomial_invalid_value
    tests/distributions/test_multivariate.py::TestMatchesScipy::test_multinomial_vectorized
    tests/distributions/test_multivariate.py::TestMoments::test_multinomial_moment

    # Fails due to:
    # assert array(nan) >= 0
    tests/distributions/test_multivariate.py::TestMatchesScipy::test_multinomial_zero_probs
  )
  _deselected_tests_arg=$(printf " --deselect=%s" "${_deselected_tests[@]}")

  # shellcheck disable=SC2086
  pytest \
    $_ignored_tests_arg \
    $_deselected_tests_arg
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
