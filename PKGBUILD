# Maintainer: otaj
# If you also want to test GPU portion of the package, set this to 1. Make sure you have a capable GPU with large enough memory 
TEST_GPU=0

pkgname=python-kornia
_name=kornia
pkgver=0.6.8
pkgrel=1
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pytest-runner')
depends=('python-pytorch')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-mypy' 'python-pytest-flake8' 'python-scipy' 'python-opencv')
options=(!emptydirs)
# because kornia does not ship `pytest.ini` with their release, we have to get a fat copy of full repo
source=("${_name}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('61949be65328ee5da8562bc453c2989c009fab34ac57a430a8304d1834b5ba5e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  make test-cpu
  if ! [ "$TEST_GPU" -eq "0" ] ; then
    make test-cuda
  fi
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
