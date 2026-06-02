# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: redponike <proton (dot) me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-gpytorch
_pkgname=${pkgname#python-}
pkgver=1.15.2
pkgrel=1
pkgdesc='A highly efficient implementation of Gaussian Processes in PyTorch'
arch=('any')
url='https://gpytorch.ai'
license=('MIT')
depends=('python-scikit-learn' 'python-linear-operator' 'python-pytorch' 'python-scipy' 'python-mpmath')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
            'ipython: for [examples] module'
            'jupyter-notebook: for [examples] module'
            'python-matplotlib: for [examples] module'
            'python-torchvision: for [examples] module'
            'python-tqdm: for [examples] module'
            'python-pyro-ppl: for [pyro] module'
            'python-pykeops: for [keops] module'
           )
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('380625e93f851b85f772b25c5fb0a6c6d2e3eb2ef667f1e566ab4f95b8775361')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  # Import smoke-test: the upstream pytest suite requires a GPU for several cases
  # plus the full optional-dep stack. An import exercises the packaged load path.
  PYTHONPATH="$PWD:$PYTHONPATH" python -c "import gpytorch; print(gpytorch.__version__)"
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
