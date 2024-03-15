# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=textual-universal-directorytree
pkgname=python-${_base}
pkgver=1.3.2
pkgrel=1
pkgdesc="A Textual Directory Tree for all File Systems"
arch=(any)
url="https://github.com/juftin/${_base}"
license=(MIT)
depends=(python-textual python-universal_pathlib)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-requests python-s3fs)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('59120a7a3d1832d284e3d0fac73c1743f3d6248a59aa2b92d089a037423cdc1a831d56c7699716df94407d7f28344f0a3c1de44a80d7287045e27238f10614fb')

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
