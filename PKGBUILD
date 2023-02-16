# Maintainer: otaj
# If you also want to test GPU portion of the package, set this to 1. Make sure you have a capable GPU with large enough memory 
TEST_GPU=0

pkgname=python-kornia
_name=kornia
pkgver=0.6.9
pkgrel=1
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pytest-runner')
depends=('python-pytorch')
optdepends=('python-accelerate: To be able to train')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-mypy' 'python-pytest-flake8' 'python-scipy' 'python-opencv')
options=(!emptydirs)
# because kornia does not ship `pytest.ini` with their release, we have to get a fat copy of full repo
source=("${_name}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('8186c470cb9f8cbec1e87da4c87e97fe5a113e785aab392c055aa21ac98385ec')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  pytest -v --device cpu --dtype float32,float64 --cov=kornia test/
  if ! [ "$TEST_GPU" -eq "0" ] ; then
    pytest -v --device cuda --dtype all --cov=kornia test/
  fi
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
