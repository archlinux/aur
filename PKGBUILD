# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=wslink
pkgname=python-${_base}
pkgdesc="Python/JavaScript library for communicating over WebSocket"
pkgver=1.11.4
pkgrel=1
arch=(any)
url="https://github.com/kitware/${_base}"
license=('custom:BSD-3-clause')
depends=(python-aiohttp)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-cryptography: SSL support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fa9d4d847cf5e9b801dfb96e3cac6b55f27e921abc66d952b4b6b1f1fec342c1219212f87ea72a181962cd07b500e58b575c54d249e83d9c1670eef53a07c360')

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
