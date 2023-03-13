# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=wslink
pkgname=python-${_base}
pkgdesc="Python/JavaScript library for communicating over WebSocket"
pkgver=1.10.1
pkgrel=1
arch=(any)
url="https://github.com/kitware/${_base}"
license=('custom:BSD-3-clause')
depends=(python-aiohttp)
makedepends=(python-setuptools)
optdepends=('python-cryptography: SSL support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6a80198dcc1906c320eee44548924096755fb5dc3011503806fb59a96b46233d577a9a6395c6aa89f31d2e92648b390045c066e675623a374a5943eb91e116c2')

prepare() {
  sed -i 's/^include/#include/' ${_base}-${pkgver}/python/MANIFEST.in
}

build() {
  cd ${_base}-${pkgver}/python
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
