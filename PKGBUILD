# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nutils
pkgname=python-${_base}
pkgdesc="Numerical Utilities for Finite Element Analysis"
pkgver=7.1
pkgrel=1
arch=(any)
url="https://github.com/evalf/${_base}"
license=(MIT)
depends=(python-numpy python-treelog python-stringly python-bottombar)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-scipy python-meshio graphviz python-matplotlib intel-oneapi-mkl)
optdepends=('python-scipy: for Scipy matrix backend support'
  'intel-oneapi-mkl: for MKL matrix backend support'
  'python-matplotlib: for interpolation support'
  'python-meshio: for parsing gmsh files')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6e0ce6e884bc52937756b7359b77d3f888bf28f31abe49b876425dae2923d4b65ed1a8a529c561a33aead76752c07bbe8e2e142c49e28e787b9c4fd1cb240274')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  # source /etc/profile.d/intel-oneapi-mkl.sh
  # local MKL_VERSION=$(pacman -Q intel-oneapi-mkl | sed -e 's/.* //; s/-.*//g')
  # MKLROOT=/opt/intel/oneapi/mkl/${MKL_VERSION::8}
  MPLBACKEND=Agg python -m pytest -k 'not cli' # not basis and
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
