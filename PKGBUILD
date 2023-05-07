# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=AABBTree
pkgname=python-${_base,,}
pkgdesc="Pure Python implementation of d-dimensional AABB tree"
pkgver=2.8.1
pkgrel=3
arch=(any)
url="https://github.com/kip-hart/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('602c74c7fcbfde0c5042fdbc611e8f96d5656f05eebf47aceb7169e39d3d0fea46194ea4307ddf3a6a71138c977224c382e0349f408cab1da50796f7f1b68c38')

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
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
