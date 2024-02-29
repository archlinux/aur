# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jose Riha <jose1711 gmail com>
_base=textual-dev
pkgname=python-${_base}
pkgdesc="Development tools for working with Textual"
pkgver=1.5.1
pkgrel=2
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-textual python-aiohttp python-click python-msgpack python-typing_extensions)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest-aiohttp python-pytest-asyncio python-time-machine)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d34100a0bf92a43088f3f5ac7c911cc9e8aaa9f5eb04b9aab328518e66fb54e29ed47617323cc3c39fd77255f08b3f33087909f97d0e60d987706d991caca8b1')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
