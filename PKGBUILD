# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
_base=NiaPy
pkgname=python-${_base,,}
pkgver=2.3.1
pkgrel=1
pkgdesc="Python micro framework for building nature-inspired algorithms"
url="https://${_base}.org"
arch=(any)
license=(MIT)
depends=(python-pandas python-matplotlib)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::https://github.com/NiaOrg/${_base}/archive/v${pkgver}.tar.gz
  numpy2.patch::https://github.com/NiaOrg/${_base}/pull/536.patch)
sha512sums=('184fea05c8790cc77f04ec974a78ad8b1c7677d6fab59695efd90b4c793967f97f8c48b7d79d863bad9df7224e3120d0ee714940847f5414d01715aafe7e562b'
  '7b75530c96cbcf15732c37a72ab7d32aa00abd448597b1605f2a7f97fe6e5560319685ff6773119113596862ace8a09d3d039e7b932a9c38ec315e53f81e7989')

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../numpy2.patch
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
