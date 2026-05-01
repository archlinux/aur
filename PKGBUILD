pkgname=mingw-w64-mumps
pkgver=5.9.0
pkgrel=1
pkgdesc='Sparse solver library using Gaussian elimination (mingw-w64)'
url='https://mumps-solver.org'
license=('CECILL-C')
depends=('mingw-w64-lapack')
makedepends=('mingw-w64-gcc')
arch=('any')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://mumps-solver.org/MUMPS_${pkgver}.tar.gz")
sha256sums=('02c6efdb91749ec0f82351d40f3f860547272a1eb1d899126a4265b4d6bcc4ca')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/MUMPS_${pkgver}"
  cp Make.inc/Makefile.inc.generic.SEQ Makefile.inc

  # calling convention
  sed -i "s|define MUMPS_CALL|define MUMPS_CALL __declspec(dllexport)|g" include/mumps_compat.h

  # static inline + __declspec(dllexport) does not make sense
  sed -i "s|define MUMPS_INLINE static inline|define MUMPS_INLINE|g" include/mumps_compat.h

  # fortran mangling
  sed -i "s/#if defined(UPPER) || defined(MUMPS_WIN32)/#if defined(UPPER)/g" src/mumps_common.h
  sed -i "s/if defined(UPPER) || defined(MUMPS_WIN32)/if defined(UPPER)/g" src/mumps_c.c
}

build() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    cp -r MUMPS_${pkgver} build-${_arch} && pushd build-${_arch}
    make -C src ../include/mumps_int_def.h
    make CC=${_arch}-gcc OPTC="-D_FORTIFY_SOURCE=3 -O2 -pipe -fexceptions --param=ssp-buffer-size=4" FC=${_arch}-gfortran FL=${_arch}-gfortran OPTF="-O2 -fallow-argument-mismatch" AR="${_arch}-ar vr " RANLIB=${_arch}-ranlib LIBOTHERS="-lpthread -lssp" -j1
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    install -d "${pkgdir}"/usr/${_arch}/{include/mumps_seq,lib}
    install -m644 include/*.h "${pkgdir}"/usr/${_arch}/include
    install -m644 lib/*.a "${pkgdir}"/usr/${_arch}/lib
    install -m644 libseq/*.h  "${pkgdir}"/usr/${_arch}/include/mumps_seq
  done
}
