
pkgname=mingw-w64-openblas
pkgrel=1
pkgver=0.2.14
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD (mingw-w64)"
arch=('any')
url="http://www.openblas.net/"
license=('custom')
options=('!buildflags' '!strip' 'staticlibs')
depends=("mingw-w64-crt")
makedepends=("mingw-w64-gcc")
provides=("mingw-w64-blas")
conflicts=("mingw-w64-blas")
source=(http://github.com/xianyi/OpenBLAS/archive/v${pkgver}.tar.gz)
md5sums=('53cda7f420e1ba0ea55de536b24c9701')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/OpenBLAS-${pkgver}"
  sed -i "s|libs netlib tests shared|libs netlib shared|g" Makefile
  sed -i "s|-lib /machine|#-lib /machine|g" exports/Makefile

  # https://github.com/xianyi/OpenBLAS/pull/527
  sed -i "s|@-cp \$(LIBDLLNAME) \$(OPENBLAS_BINARY_DIR)|@-cp \$(LIBDLLNAME) \$(DESTDIR)\$(OPENBLAS_BINARY_DIR)|g" Makefile.install
  sed -i "s|@-cp \$(LIBDLLNAME).a \$(OPENBLAS_LIBRARY_DIR)|@-cp \$(LIBDLLNAME).a \$(DESTDIR)\$(OPENBLAS_BINARY_DIR)|g" Makefile.install
}

build () {
  cd "$srcdir"
  NPROC=`grep "physical id" /proc/cpuinfo|sort|uniq|wc -l`
  NCORE4PROC=`grep "cores" /proc/cpuinfo|sort|tail -n 1|sed -e 's/cpu cores.*: //'`
  let NCORE=NPROC*NCORE4PROC

  export libprefix=libblas
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && cp -r "$srcdir"/OpenBLAS-${pkgver}/* build-${_arch} && pushd build-${_arch}
    binary=32
    if test "${_arch}" = "x86_64-w64-mingw32"; then
      binary=64
    fi
    make CC=${_arch}-gcc FC=${_arch}-gfortran BINARY=$binary HOSTCC=gcc \
      CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4" \
      USE_OPENMP=1 NO_LAPACK=1 NUM_THREADS=$NCORE LIBPREFIX=$libprefix \
      MAJOR_VERSION=3 NO_CBLAS=1 NO_AFFINITY=1
    sed -i "1iLIBRARY $libprefix.dll\n" exports/libopenblas.def
    ${_arch}-dlltool -d exports/libopenblas.def -l $libprefix.dll.a
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make PREFIX=/usr/$_arch CC=${_arch}-gcc FC=${_arch}-gfortran BINARY=$bin HOSTCC=gcc NO_LAPACK=1 NO_CBLAS=1 LIBPREFIX=$libprefix DESTDIR="${pkgdir}" install
    install -d "${pkgdir}"/usr/$_arch/bin
    install -m644 *.dll.a "${pkgdir}"/usr/${_arch}/lib
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

