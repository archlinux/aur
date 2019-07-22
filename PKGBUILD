
pkgname=mingw-w64-suitesparse
pkgver=5.4.0
pkgrel=1
pkgdesc="A collection of sparse matrix libraries (mingw-w64)"
url="http://www.cise.ufl.edu/research/sparse/SuiteSparse/"
arch=('any')
depends=('mingw-w64-lapack')
makedepends=('mingw-w64-gcc')
license=('GPL')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-${pkgver}.tar.gz")
sha256sums=('374dd136696c653e34ef3212dc8ab5b61d9a67a6791d5ec4841efb838e94dbd1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/SuiteSparse
  sed -i "s|AR_TARGET = \$(LIBRARY).lib|AR_TARGET = \$(LIBRARY).a|g" SuiteSparse_config/SuiteSparse_config.mk
  for _lib in AMD CAMD COLAMD BTF KLU LDL CCOLAMD CHOLMOD UMFPACK CXSparse RBio SPQR; do
    sed -i "s| -lsuitesparseconfig| -lsuitesparseconfig -L../../lib|g" ${_lib}/Lib/Makefile
  done
  sed -i "s| -lsuitesparseconfig| -lsuitesparseconfig -fopenmp|g" CHOLMOD/Lib/Makefile
}

build() {
  cd "$srcdir"
  for _arch in ${_architectures}; do    
    cp -r SuiteSparse build-${_arch} && pushd build-${_arch}
    for _lib in SuiteSparse_config AMD CAMD COLAMD BTF KLU LDL CCOLAMD CHOLMOD UMFPACK CXSparse RBio SPQR; do
      make -C ${_lib} library UNAME=Windows CC=${_arch}-gcc CXX=${_arch}-g++ F77=${_arch}-gfortran \
        AR=${_arch}-ar RANLIB=${_arch}-ranlib BLAS='-lblas -lgfortran -lquadmath' CHOLMOD_CONFIG='-DNPARTITION' \
        CFLAGS="-D_FORTIFY_SOURCE=2 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4" \
        SO_OPTS="-shared -Wl,--out-implib,\${SO_PLAIN}.a"
    done
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    install -dm755 "${pkgdir}"/usr/${_arch}/{lib,include/suitesparse}
    cd "${srcdir}"/build-${_arch} 
    for _lib in SuiteSparse_config AMD CAMD COLAMD BTF KLU LDL CCOLAMD UMFPACK CHOLMOD CXSparse RBio SPQR; do
      make -C ${_lib} install UNAME=Windows CC=${_arch}-gcc CXX=${_arch}-g++ F77=${_arch}-gfortran \
        AR=${_arch}-ar RANLIB=${_arch}-ranlib BLAS='-lblas -lgfortran -lquadmath' CHOLMOD_CONFIG='-DNPARTITION' \
        CFLAGS="-D_FORTIFY_SOURCE=2 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4" \
        SO_OPTS="-shared -Wl,--out-implib,\${SO_PLAIN}.a" INSTALL_LIB="${pkgdir}"/usr/${_arch}/lib INSTALL_INCLUDE="${pkgdir}"/usr/${_arch}/include/suitesparse
    done
#     make UNAME=Windows CC=${_arch}-gcc CXX=${_arch}-g++ F77=${_arch}-gfortran \
#         AR=${_arch}-ar RANLIB=${_arch}-ranlib BLAS='-lblas -lgfortran -lquadmath' CHOLMOD_CONFIG='-DNPARTITION' \
#         CFLAGS="-D_FORTIFY_SOURCE=2 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4" \
#         SO_OPTS="-shared -Wl,--out-implib,\${SO_PLAIN}.a" INSTALL_LIB="${pkgdir}"/usr/${_arch}/lib INSTALL_INCLUDE="${pkgdir}"/usr/${_arch}/include/suitesparse install
#     ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
#     ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
