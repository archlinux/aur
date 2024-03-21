# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=textual-universal-directorytree
pkgname=python-${_base}
pkgver=1.5.0
pkgrel=1
pkgdesc="A Textual Directory Tree for all File Systems"
arch=(any)
url="https://github.com/juftin/${_base}"
license=(MIT)
depends=(python-textual python-universal_pathlib)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-requests python-s3fs)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1e35d757c484c37478e02252a08c58b6e148b88deeb91837ca355d5e8b6916c927f25b045a5379f1dd687fbae335b1641cb5c6d7d0c0b216e14b362277d84593')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not github_screenshot'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
