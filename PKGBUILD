# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=felupe
pkgname=python-${_base}
pkgdesc="Finite Element Analysis"
pkgver=5.2.0
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(python-scipy)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-meshio python-h5py python-matplotlib)
optdepends=('python-meshio: for export mesh'
  'python-h5py: for XDMF-export'
  'python-numba: for JIT compiler support'
  'python-sparse: for sparse arrays support'
  'python-einsumt: for multithreaded numpy.einsum support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ec0f564afc28047978b863d306d1d3f67f43badd1959fc23e5a2414da1217a4539ec4c13a6194594ea60755e0e7a5b9fba250551c7b9d1f9a0acb71423d9044f')

build() {
  cd ${_base}-${pkgver}
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest tests -k 'not form and not mechanics and not mpc and not newton'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
