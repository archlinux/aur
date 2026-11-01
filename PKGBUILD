# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=textual-universal-directorytree
pkgname=python-${_base}
pkgver=1.8.0
pkgrel=1
pkgdesc="A Textual Directory Tree for all File Systems"
arch=(any)
url="https://github.com/juftin/${_base}"
license=(MIT)
depends=(python-textual python-universal_pathlib)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-requests python-s3fs)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('86a6ad1095d15f097b2920046df4c99a8351dab6dce06e3101a911772c93af47562d6ba8d3bc4dc31bdf01d1fe2d96f648c9e888d1ebcebf2887e35f834ebb0e')

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
