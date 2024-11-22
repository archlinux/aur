# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jose Riha <jose1711 gmail com>
_base=textual-dev
pkgname=python-${_base}
pkgdesc="Development tools for working with Textual"
pkgver=1.7.1
pkgrel=1
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-textual python-textual-serve python-aiohttp python-click python-msgpack python-typing_extensions)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest-aiohttp python-pytest-asyncio python-time-machine)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('421076c1e512d65f0fcb02f7f2889ed5c81ebff5abe59488f6cfe236f9ea24b3203a6cb42b837718bd8d457f9bdb1afaed5d5a87f50b2f6bd5e23fe39a29a91d')

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
