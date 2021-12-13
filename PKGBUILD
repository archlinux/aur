# Maintainer: otaj
# If you also want to test GPU portion of the package, set this to 1. Make sure you have a capable GPU with large enough memory 
TEST_GPU=0

pkgname=python-kornia
_name=kornia
pkgver=0.6.2
pkgrel=1
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=('python-setuptools' 'python-pip')
depends=('python-pytorch')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-mypy' 'python-pytest-flake8')
options=(!emptydirs)
# because kornia does not ship `pytest.ini` with their release, we have to get a fat copy of full repo
source=("${_name}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('f4aa4b5d7882bf8337269a3378dcd2f88f9a3704d36b4d08073a0c01f1f6ab9b')

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  make test-cpu
  if ! [ "$TEST_GPU" -eq "0" ] ; then
    make test-cuda
  fi
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
