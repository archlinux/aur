# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=wslink
pkgname=python-${_base}
pkgdesc="Python/JavaScript library for communicating over WebSocket"
pkgver=2.5.2
pkgrel=1
arch=(any)
url="https://github.com/kitware/${_base}"
license=(BSD-3-Clause)
depends=(python-aiohttp python-msgpack)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-cryptography: SSL support'
  'ipython: jupyter backend support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('dadf29e5dd9f04e8813e34a890de563b811f964636351caf630cf71aa2c57e14102f444639fd56b225b42fd6dcb967b60f3c43f9625dc67f2aee2b9d8f8c3ceb')

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
