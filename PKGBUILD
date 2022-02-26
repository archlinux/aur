# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nutils
pkgname=python-${_base}
pkgdesc="Numerical Utilities for Finite Element Analysis"
pkgver=7.0
pkgrel=1
arch=(any)
url="https://github.com/evalf/${_base}"
license=(MIT)
depends=(python-numpy python-treelog python-stringly)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-scipy intel-mkl python-meshio graphviz python-matplotlib) # python-nutils-si-git
optdepends=('python-scipy: for Scipy matrix backend support'
  'intel-mkl: for MKL matrix backend support'
  'python-matplotlib: for interpolation support'
  'python-meshio: for parsing gmsh files')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f991a8488620a0c4ed67e7a609501cd484cd5f131ab47b935e8bc4a6ae59daf73f5abad46b78b57c07323de652fd0d2b0516228c50395bd7cc34b46889f06aa5')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  MPLBACKEND=Agg python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
