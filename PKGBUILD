# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=wslink
pkgname=python-${_base}
pkgdesc="Python/JavaScript library for communicating over WebSocket"
pkgver=1.11.1
pkgrel=1
arch=(any)
url="https://github.com/kitware/${_base}"
license=('custom:BSD-3-clause')
depends=(python-aiohttp)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-cryptography: SSL support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('269e5c6589b7591ac0037ffb7e4c9692219aaa77eb1a2e6ea8e2274666bcdc6a877d46f87898b065f4e367e6844a75f9d8311ea92cd815b3d6eedefd27c162a8')

prepare() {
  sed -i 's/^include/#include/' ${_base}-${pkgver}/python/MANIFEST.in
}

build() {
  cd ${_base}-${pkgver}/python
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
