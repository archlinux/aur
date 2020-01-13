# Maintainer: andrewwja <aanderso [at] tcd [DOt] ie>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>

pkgname=aarch64-linux-gnu-openblas-lapack-openmp
_PkgName=OpenBLAS
_pkgname=openblas
pkgver=0.3.7
_lapackver=3.8.0
pkgrel=2
pkgdesc="Optimized BLAS library based on GotoBLAS2 1.13 BSD (providing blas, lapack, and cblas)"
arch=('any')
url="http://www.openblas.net/"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl' 'aarch64-linux-gnu-gcc')
provides=('aarch64-linux-gnu-openblas' "aarch64-linux-gnu-blas=${_lapackver}" "aarch64-linux-gnu-lapack=${_lapackver}" "aarch64-linux-gnu-cblas=${_lapackver}" "aarch64-linux-gnu-lapacke=${_lapackver}")
conflicts=()
options=(!emptydirs !strip staticlibs)
source=(${_PkgName}-${pkgver}.tar.gz::https://github.com/xianyi/${_PkgName}/archive/v${pkgver}.tar.gz)
sha256sums=('SKIP')

_ncpus=$(eval "cat /proc/cpuinfo | grep MHz | wc -l")

_config="BINARY=64 CC=aarch64-linux-gnu-gcc FC=aarch64-linux-gnu-gfortran HOSTCC=gcc TARGET=ARMV8 \
  USE_OPENMP=1 USE_THREAD=1 USE_COMPILER_TLS=0 \
  NO_LAPACK=0 BUILD_LAPACK_DEPRECATED=1 \
  MAKE_NB_JOBS=${_ncpus} \
  PREFIX=/usr/aarch64-linux-gnu "

build(){
  cd "${srcdir}/${_PkgName}-${pkgver}"

  make ${_config} CFLAGS="-mtune=generic -I /usr/aarch64/include -L /usr/aarch64/lib -L /usr/aarch64/lib64" libs netlib shared
}

check(){
  #cd "${srcdir}/${_PkgName}-${pkgver}"

  #make ${_config} tests

  true
}

package(){
  cd "${srcdir}/${_PkgName}-${pkgver}"

  make ${_config} DESTDIR="${pkgdir}" install

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/aarch64-linux-gnu/share/licenses/${pkgname}/LICENSE"

  # Symlink to provide blas, cblas, lapack and lapacke
  cd "${pkgdir}/usr/aarch64-linux-gnu/lib/"
  # BLAS
  ln -sf libopenblas.so libblas.so
  ln -sf libopenblas.so libblas.so.${_lapackver:0:1}
  ln -sf libopenblas.so libblas.so.${_lapackver}
  # CBLAS
  ln -sf libopenblas.so libcblas.so
  ln -sf libopenblas.so libcblas.so.${_lapackver:0:1}
  ln -sf libopenblas.so libcblas.so.${_lapackver}
  # LAPACK
  ln -sf libopenblas.so liblapack.so
  ln -sf libopenblas.so liblapack.so.${_lapackver:0:1}
  ln -sf libopenblas.so liblapack.so.${_lapackver}
  # LAPACKE
  ln -sf libopenblas.so liblapacke.so
  ln -sf libopenblas.so liblapacke.so.${_lapackver:0:1}
  ln -sf libopenblas.so liblapacke.so.${_lapackver}
}
# vim:set ts=2 sw=2 et:
