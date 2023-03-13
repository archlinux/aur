# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-server
pkgname=python-${_base}
pkgdesc="Internal server side implementation of trame"
pkgver=2.9.1
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache)
depends=(python-wslink)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5ed3dce74025329b143824a175610ccad3757be075335028e9af5693a4dd51d6dd815bcd3aec7a4ca228adddff819d43c7ed1e858fd3bb46330b238cfc0fe837')

prepare() {
  sed -i 's/^include/#include/' ${_base}-${pkgver}/MANIFEST.in
}

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
