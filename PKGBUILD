# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgname='python2-mock'
_name="${pkgname#python2-}"
pkgver=3.0.5
pkgrel=8
pkgdesc='Mocking and patching library for testing (backport unittest.mock) (deprecated)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('BSD')
depends=(
  'python2'
  'python2-funcsigs'
  'python2-pbr'
  'python2-six'
)
checkdepends=('python2-funcsigs')
_tarname="${_name}-${pkgver}"
source=("${_tarname}::https://github.com/testing-cabal/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('9ab4f0c794f5701ba1367d982cf79a5662d4233753d12ed9c88ae20282db1f44be73f84c4d9f6d03ff64926b8c1b6d0c9a79b2a4724a3eb36c247ffd4ab03e2d')

prepare() {
  cd "${_tarname}"

  # use unittest instead of unittest2 as they are the same on recent python*
  sed -i 's/unittest2/unittest/g' mock/tests/*.py
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  cd "${_tarname}"

  # Remove Python 3 only test
  rm mock/tests/testhelpers_py3.py

  python2 -m unittest discover
}

package() {
  cd "${_tarname}"

  python2 setup.py install --optimize=1 --root="${pkgdir}"

  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
