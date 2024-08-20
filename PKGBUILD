# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mole
pkgname=lib${_base}
pkgver=1.0
pkgrel=1
pkgdesc="Mimetic Operators Library Enhanced"
url="https://github.com/csrc-sdsu/${_base}"
license=(GPL-3.0-only)
arch=(x86_64)
depends=(armadillo)
makedepends=(doxygen eigen graphviz openblas)
optdepends=('matlab: for MATLAB support'
  'octave: for Octave support'
  'eigen: for the sparse LU factorization')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c9a167d30b4adaabb3e3ea9f3ab4f135ae8e23335b7ebf324d011a7ca944c0fd33debcbf2e2f5a9ba56b3c1d84c5d2f15246bca568034719fe42d776a41b7de1')

build() {
  cd ${_base}-${pkgver}
  make SHARED_LIB=1 EIGEN=1 ARMA=1
  doxygen
}

package() {
  cd ${_base}-${pkgver}
  install -Dm 755 mole_C++/${pkgname}.so -t "${pkgdir}/usr/lib"
  make clean

  install -d ${pkgdir}/usr/include/${_base}
  install mole_C++/*.h ${pkgdir}/usr/include/${_base}

  install -d "$pkgdir/usr/share/${pkgname}"
  mv mole_MATLAB ${pkgdir}/usr/share/${pkgname}

  # install docs
  install -d ${pkgdir}/usr/share/doc/${pkgname}
  mv doc_C++ ${pkgdir}/usr/share/doc/${pkgname}
  mv doc_MATLAB ${pkgdir}/usr/share/doc/${pkgname}

  # install tutorials
  install -d ${pkgdir}/usr/share/doc/${pkgname}/examples
  mv examples_C++ ${pkgdir}/usr/share/doc/${pkgname}/examples
  mv examples_MATLAB ${pkgdir}/usr/share/doc/${pkgname}/examples

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}