# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=numpy-typing-compat
pkgname=python-${_base}
pkgdesc="Static typing compatibility layer for older versions of NumPy"
pkgver=20250818
pkgrel=1
arch=(any)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python-jinja uv)
makedepends=(python-build python-installer python-numpy python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('513a167566b91c25bd1a7aed289caefa145b3e9f9ac32668ceb8f1ff08de5b8a94b4572d894ac32139d6472003d03129f5c2499a82b238c7b1bcd97ad6dea3ca')

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
