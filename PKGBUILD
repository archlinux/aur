# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=browsr
pkgver=1.10.7
pkgrel=1
pkgdesc="TUI File Browser App"
arch=(any)
url="https://github.com/juftin/${pkgname}"
license=(MIT)
depends=(python-art python-fsspec python-pandas python-rich-click python-rich-pixels
  python-textual python-universal_pathlib python-pillow python-pymupdf)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-requests)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fd8fe8245398d3a702a10d870572207cf808acfc76162e99c9f2d85c12f6a9df5bcc5a2a69fab4481899a7bf7c80f99180e038c4ad30aa869621e4cd6448c38a')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not github_screenshot and not screenshot_license and not textual_app_context_path_github'
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
