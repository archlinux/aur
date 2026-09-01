# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=multicollections
pkgname=python-${_base}
pkgdesc="Fully generic MultiDict class"
pkgver=1.1.7
pkgrel=1
arch=(any)
url="https://github.com/gerlero/${_base}"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-uv-build)
checkdepends=(python-pytest python-multidict)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('671a414a5310ffe79c4fc36ea7f95882362fba94c747a1956a6916e9c8932e3dd805e894fdb9e72b42619a6e88284a3d3116996dbfe9370ae6af3fc8cec96924')

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
