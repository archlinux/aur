# Maintainer: andrewwja <aanderso [at] tcd [DOt] ie>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>

pkgname=arm-linux-gnueabihf-openblas-lapack-openmp
_PkgName=OpenBLAS
_pkgname=openblas
pkgver=0.3.4
_lapackver=3.8.0
pkgrel=19
pkgdesc="Optimized BLAS library based on GotoBLAS2 1.13 BSD (providing blas, lapack, and cblas)"
arch=('any')
url="http://www.openblas.net/"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl' 'arm-linux-gnueabihf-gcc')
provides=('arm-linux-gnueabihf-openblas' "arm-linux-gnueabihf-blas=${_lapackver}" "arm-linux-gnueabihf-lapack=${_lapackver}" "arm-linux-gnueabihf-cblas=${_lapackver}" "arm-linux-gnueabihf-lapacke=${_lapackver}")
conflicts=()
options=(!emptydirs !strip)
source=(${_PkgName}-${pkgver}.tar.gz::https://github.com/xianyi/${_PkgName}/archive/v${pkgver}.tar.gz)
sha256sums=('SKIP')

_ncpus=$(eval "cat /proc/cpuinfo | grep MHz | wc -l")

_config="BINARY=32 CC=arm-linux-gnueabihf-gcc FC=arm-linux-gnueabihf-gfortran HOSTCC=gcc TARGET=ARMV7 \
  USE_OPENMP=1 USE_THREAD=1 USE_COMPILER_TLS=0 \
  NO_STATIC=0 NO_SHARED=0 \
  NO_LAPACK=0 BUILD_LAPACK_DEPRECATED=1 \
  MAKE_NB_JOBS=${_ncpus} \
  PREFIX=/usr/arm-linux-gnueabihf "

build(){
  cd "${srcdir}/${_PkgName}-${pkgver}"

  make ${_config} CFLAGS="-mtune=generic-armv7-a -I /usr/arm-linux-gnueabihf/include -L /usr/arm-linux-gnueabihf/lib" libs netlib shared
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
  install -Dm644 LICENSE "${pkgdir}/usr/arm-linux-gnueabihf/share/licenses/${pkgname}/LICENSE"

  # Install static lib
  _static_lib_name=`ls libopenblas_*.a`
  install -Dm644 ${_static_lib_name} "${pkgdir}/usr/arm-linux-gnueabihf/lib/${_static_lib_name}"

  # Symlink to provide blas, cblas, lapack and lapacke
  cd "${pkgdir}/usr/arm-linux-gnueabihf/lib/"
  # Static lib
  ln -sf ${_static_lib_name} libopenblas.a
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
