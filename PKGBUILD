# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=scipy
pkgname=pypy3-${_base}
pkgver=1.15.2
pkgrel=1
pkgdesc="Fundamental algorithms for scientific computing in Python"
arch=(x86_64)
url="https://${_base}.org"
license=(BSD-3-Clause)
depends=(blas gcc-libs glibc lapack pypy3-numpy) # pypy3-platformdirs pypy3-pooch
makedepends=(gcc-fortran pypy3-build pypy3-installer meson-pypy3 pypy3-cython pypy3-pybind11 pypy3-pythran)
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('c5eba94a32970f0978780c453656f8dbe1784461e5dd37615b224079bff4aed49e20d1c183e1cad9da8aa141392c6afd33276412bd319298a5e469de327ee58a')
options=(!lto)

build() {
  cd ${_base}-${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation \
    -C setup-args=-Dblas=blas \
    -C setup-args=-Dlapack=lapack
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/pypy3-$pkgname
}
