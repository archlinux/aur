# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=numpy-typing-compat
pkgname=python-${_base}
pkgdesc="Static typing compatibility layer for older versions of NumPy"
pkgver=20250814
pkgrel=1
arch=(any)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python-jinja uv)
makedepends=(python-build python-installer python-numpy python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1b4a27212336c8a8f21238e73bd9c8ab5a28c4d913d8f28763e142ea3dfa6af8bb1ed5f0c233435469b374706fc6f32319f7695935e7ac212e57a8a0a15fdec3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  _numpy_version=$(pacman -Q python-numpy | sed -e 's/.* //; s/-.*//g')
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="$pkgdir" dist/${_base//-/_}-${_numpy_version::3}.*py3-none-any.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
