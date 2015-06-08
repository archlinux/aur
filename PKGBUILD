
pkgname=mingw-w64-suitesparse
pkgver=4.4.3
pkgrel=1
pkgdesc="A collection of sparse matrix libraries (mingw-w64)"
url="http://www.cise.ufl.edu/research/sparse/SuiteSparse/"
arch=('any')
depends=('mingw-w64-lapack')
makedepends=('mingw-w64-gcc')
license=('GPL')
options=('!buildflags' '!strip' 'staticlibs')
source=(http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-${pkgver}.tar.gz)
sha1sums=('3a583ca4c09c6e9d7c574d313ad93e514478bb29')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"
  for _arch in ${_architectures}; do    
    cp -r SuiteSparse build-${_arch} && pushd build-${_arch}
    for _lib in SuiteSparse_config AMD CAMD COLAMD BTF KLU LDL CCOLAMD UMFPACK CHOLMOD CXSparse RBio SPQR; do
      make -C ${_lib} library CC=${_arch}-gcc CXX=${_arch}-g++ F77=${_arch}-gfortran \
        AR=${_arch}-ar RANLIB=${_arch}-ranlib BLAS='-lblas -lgfortran -lgfortranbegin -lquadmath' CHOLMOD_CONFIG='-DNPARTITION' \
        CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
    done
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    install -dm755 "${pkgdir}"/usr/${_arch}/{lib,include/suitesparse}
    cd "${srcdir}"/build-${_arch} 
    for _lib in SuiteSparse_config AMD CAMD COLAMD BTF KLU LDL CCOLAMD UMFPACK CHOLMOD CXSparse RBio SPQR; do
      make -C ${_lib} install INSTALL_LIB="${pkgdir}"/usr/${_arch}/lib INSTALL_INCLUDE="${pkgdir}"/usr/${_arch}/include/suitesparse
    done
    make INSTALL_LIB="${pkgdir}"/usr/${_arch}/lib INSTALL_INCLUDE="${pkgdir}"/usr/${_arch}/include/suitesparse install
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
