# Maintainer: otaj
# If you also want to test GPU portion of the package, set this to 1. Make sure you have a capable GPU with large enough memory 
TEST_GPU=0

pkgname=python-kornia
_name=kornia
pkgver=0.5.8
pkgrel=1
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=('python-setuptools' 'python-pip')
depends=('python-pytorch')
checkdepends=('python-pytest')
options=(!emptydirs)
# because kornia does not ship `pytest.ini` with their release, we have to get a fat copy of full repo
source=(${_name}-${pkgver}.tar.gz::"${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e0a2686c7b2856b4ccc2883817d96c7d888c6df4745beedcfe307cbfe0b50cca')

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  pytest -v --device cpu --dtype float32,float64 test/
  if ! [ "$TEST_GPU" -eq "0" ] ; then
    pytest -v --device cuda --dtype float32,float64 test/
  fi
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
