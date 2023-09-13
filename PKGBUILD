# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=browsr
pkgver=1.15.0
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
sha512sums=('3d81e19bcd495530e7f36aa08ce99f460db5b49e8fea1b75b1056bbbd1388d00649df93e219aea1354ce6ca5fad1a3ca8227c3a1e0f3811c45f77a16f1cfe54f')

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
