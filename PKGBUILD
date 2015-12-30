# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>

pkgname=openblas-lapack
_PkgName=OpenBLAS
_pkgname=openblas
pkgver=0.2.15
pkgrel=2
pkgdesc="Optimized BLAS library based on GotoBLAS2 1.13 BSD (providing blas, lapack, and cblas)"
arch=('i686' 'x86_64')
url="http://xianyi.github.com/OpenBLAS/"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl' 'gcc-fortran')
provides=('openblas' 'blas=3.5.0' 'lapack=3.5.0' 'cblas')
conflicts=('openblas' 'blas' 'lapack' 'cblas')
options=(!emptydirs)
source=(${_PkgName}-${pkgver}.tar.gz::https://github.com/xianyi/${_PkgName}/archive/v${pkgver}.tar.gz)
sha256sums=('73c40ace5978282224e5e122a41c8388c5a19e65a6f2329c2b7c0b61bacc9044')

_config="FC=gfortran USE_OPENMP=0 USE_THREAD=1 MAJOR_VERSION=3 NO_LAPACK=0"

build(){
  cd "${srcdir}/${_PkgName}-${pkgver}"

  make ${_config} libs netlib shared
}

check(){
  cd "${srcdir}/${_PkgName}-${pkgver}"

  make ${_config} tests
}
package(){
  cd "${srcdir}/${_PkgName}-${pkgver}"

  make ${_config} PREFIX=/usr DESTDIR="${pkgdir}" install

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Symlink to provide blas, cblas and lapack
  cd "${pkgdir}/usr/lib/"
  # BLAS
  ln -sf libopenblas.so libblas.so
  ln -sf libopenblas.so libblas.so.3
  ln -sf libopenblas.so libblas.so.3.5.0
  # CBLAS
  ln -sf libopenblas.so libcblas.so
  # LAPACK
  ln -sf libopenblas.so liblapack.so
  ln -sf libopenblas.so liblapack.so.3
  ln -sf libopenblas.so liblapack.so.3.5.0
  # LAPACKE
  ln -sf libopenblas.so liblapacke.so
}
# vim:set ts=2 sw=2 et:
