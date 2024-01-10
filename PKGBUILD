# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=browsr
pkgver=1.18.0
pkgrel=1
pkgdesc="TUI File Browser App"
arch=(any)
url="https://github.com/juftin/${pkgname}"
license=(MIT)
depends=(python-art python-rich-click python-pandas python-rich-pixels
  python-textual-universal-directorytree python-pillow python-pymupdf)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-requests)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('780f89c236a73e7e70a4899a8432f3860a9951742baf69d5a73a51851d79133bea4bfdedeb0dc724246bc964e2991c9d00f51c18a6fc46765f0b008e8d5298bc')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not screenshots'
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
