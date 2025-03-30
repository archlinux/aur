# Maintainer: redponike <proton (dot) me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-gpytorch
_pkgname=${pkgname#python-}
pkgver=1.14
pkgrel=2
pkgdesc='A highly efficient implementation of Gaussian Processes in PyTorch'
arch=('x86_64')
url='https://gpytorch.ai'
license=('MIT')
depends=('python-scikit-learn' 'python-linear-operator' 'python-pytorch' 'python-scipy' 'python-mpmath')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-nbval' 'flake8')
optdepends=(
            'ipython: for [examples] module'
            'jupyter-notebook: for [examples] module'
            'python-matplotlib: for [examples] module'
            'python-scipy: for [examples] module'
            'python-torchvision: for [examples] module'
            'python-tqdm: for [examples] module'
            'python-pyro-ppl: for [pyro] module'
            'python-pykeops: for [keops] module'
           )
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('032cc11e6a46e1e4bc7763fcef318cc830aceaea85a7289f27b2288c7a339a8d')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  pytest -vv --deselect=test/priors/test_half_cauchy_prior.py::TestHalfCauchyPrior::test_half_cauchy_prior_to_gpu \
             --deselect=test/priors/test_half_normal_prior.py::TestHalfNormalPrior::test_half_normal_prior_to_gpu \
             --deselect=test/priors/test_lkj_prior.py::TestLKJPrior::test_lkj_prior_to_gpu \
             --deselect=test/priors/test_lkj_prior.py::TestLKJCholeskyFactorPrior::test_lkj_cholesky_factor_prior_to_gpu \
             --deselect=test/priors/test_lkj_prior.py::TestLKJCovariancePrior::test_lkj_covariance_prior_to_gpu \
             --deselect=test/priors/test_multivariate_normal_prior.py::TestMultivariateNormalPrior::test_multivariate_normal_prior_to_gpu \
             --deselect=test/variational/test_natural_variational_distribution.py::TestNatVariational::test_optimization_optimal_error
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
