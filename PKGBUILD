# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nutils
pkgname=python-${_base}
pkgdesc="Numerical Utilities for Finite Element Analysis"
pkgver=7.2
pkgrel=3
arch=(any)
url="https://github.com/evalf/${_base}"
license=(MIT)
depends=(python-bottombar python-numpy python-treelog python-stringly)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-scipy python-meshio graphviz python-matplotlib intel-oneapi-mkl)
optdepends=('python-scipy: for Scipy matrix backend support'
  'intel-oneapi-mkl: for MKL matrix backend support'
  'python-matplotlib: for interpolation support'
  'python-meshio: for parsing gmsh files') # python-pillow
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d300cba3b1232e78245e740019ccf3d5840dbc4c72a447eb8c8a9bb8f63029473af3400c023f2c1543c18e951c6f0e2498b4913d2e64d7089232eceaf64bde01')

prepare() {
  sed -i 's/treelog>=1.0b5<2/treelog/' ${_base}-${pkgver}/setup.py
  sed -i 's/stringly>=1.0b2<2/stringly/' ${_base}-${pkgver}/setup.py
}

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  MPLBACKEND=Agg python -m pytest -k 'not cli and not isbool'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
