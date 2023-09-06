# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=browsr
pkgver=1.14.0
pkgrel=1
pkgdesc="TUI File Browser App"
arch=(any)
url="https://github.com/juftin/${pkgname}"
license=(MIT)
depends=(python-art python-pandas python-rich-click python-rich-pixels
  python-textual-universal-directorytree python-pillow python-pymupdf)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-requests)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4b253ec251e0b50f5468d589534d9a1e08c550a848ced8261e7162c8124e2c9f0b12080d06bfae330b74a55c4362d789036cfcca7295f9742f1ab6871f254c14')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
