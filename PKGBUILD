# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=multicollections
pkgname=python-${_base}
pkgdesc="Fully generic MultiDict class"
pkgver=1.1.5
pkgrel=1
arch=(any)
url="https://github.com/gerlero/${_base}"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-uv-build)
checkdepends=(python-pytest python-multidict)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b86232a960519d4e201415961e484c3615ed9367da01c6b794ecdda68528fe62f880554dde5c5cc875df1c648489eac456135046d2fd0476905aa6cc420b066c')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
