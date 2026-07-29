# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=multicollections
pkgname=python-${_base}
pkgdesc="Fully generic MultiDict class"
pkgver=1.1.1
pkgrel=1
arch=(any)
url="https://github.com/gerlero/${_base}"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-uv-build)
checkdepends=(python-pytest python-multidict)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0c383d6633df5464ad8434ef6dff55bced0a5f519d045dd304429746bc2e50a30ea7a19518082831a9b58b8a02772c0ceb3d6cc3c5912de4d775bb1dccf190bb')

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
