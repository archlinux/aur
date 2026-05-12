# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-server
pkgname=python-${_base}
pkgdesc="Internal server side implementation of trame"
pkgver=3.12.1
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache-2.0)
depends=(python-wslink python-trame-common python-more-itertools)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest-asyncio)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9c924cd662b0fa4cfecc7038d466bcd193ba51396b3ddd97ed8a3ca71b772cde50bc44d4dba949f468e2069f16ad98f8d4d791670ccc692eb3a28977a89b9d3a')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    tests/test_controller.py tests/test_state.py tests/test_translator.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
