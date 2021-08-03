pkgname=mingw-w64-mumps
pkgver=5.4.0
pkgrel=1
pkgdesc='Sparse solver library using Gaussian elimination (mingw-w64)'
url='http://mumps.enseeiht.fr'
license=('custom')
depends=('mingw-w64-lapack')
makedepends=('mingw-w64-gcc')
arch=('any')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://mumps.enseeiht.fr/MUMPS_${pkgver}.tar.gz")
sha256sums=('c613414683e462da7c152c131cebf34f937e79b30571424060dd673368bbf627')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/MUMPS_${pkgver}"
  cp Make.inc/Makefile.inc.generic.SEQ Makefile.inc
  sed -i "s|define MUMPS_CALL|define MUMPS_CALL __declspec(dllexport)|g" include/mumps_compat.h
  sed -i "s/#if defined(UPPER) || defined(MUMPS_WIN32)/#if defined(UPPER)/g" src/mumps_common.h
  sed -i "s/if defined(UPPER) || defined(MUMPS_WIN32)/if defined(UPPER)/g" src/mumps_c.c
}

build() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    cp -r MUMPS_${pkgver} build-${_arch} && pushd build-${_arch}
    make -C src ../include/mumps_int_def.h
    make CC=${_arch}-gcc OPTC="-D_FORTIFY_SOURCE=2 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4" FC=${_arch}-gfortran FL=${_arch}-gfortran OPTF="-O2 -fallow-argument-mismatch" AR="${_arch}-ar vr " RANLIB=${_arch}-ranlib LIBOTHERS="-lpthread -lssp" -j1
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    install -d "${pkgdir}"/usr/${_arch}/{include/MUMPS,lib}
    install -m644 include/*.h "${pkgdir}"/usr/${_arch}/include/MUMPS
    install -m644 lib/*.a libseq/*.a "${pkgdir}"/usr/${_arch}/lib
  done
}
