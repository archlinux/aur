pkgname=mingw-w64-suitesparse
pkgver=7.2.2
pkgrel=1
pkgdesc="A collection of sparse matrix libraries (mingw-w64)"
url="https://people.engr.tamu.edu/davis/suitesparse.html"
arch=('any')
depends=('mingw-w64-lapack' 'mingw-w64-mpfr')
makedepends=('mingw-w64-cmake')
license=('GPL')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v${pkgver}.tar.gz")
sha256sums=('ec0ece3348ce410d938543dc94f63fc7816016610f2d0d5cfc633c8f86597e02')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_subdirectories="SuiteSparse_config Mongoose AMD BTF CAMD CCOLAMD COLAMD CHOLMOD CXSparse LDL KLU UMFPACK RBio SuiteSparse_GPURuntime GPUQREngine SPQR SPEX GraphBLAS"

prepare () {
  cd "$srcdir"/SuiteSparse-${pkgver}
}

build() {
  cd "$srcdir"
  # we need pkgdir for CMAKE_STAGING_PREFIX, so build in package()
}

package() {
  for _arch in ${_architectures}; do
    for _subdir in ${_subdirectories}; do
      cd "$srcdir/SuiteSparse-${pkgver}/${_subdir}"
      mkdir -p build-${_arch} && cd build-${_arch}
      LDPRELOAD= ${_arch}-cmake -DNPARTITION=1 -DBLA_VENDOR=Generic -DCMAKE_STAGING_PREFIX="$pkgdir"/usr/${_arch} -DHAVE_GETENV_HOME=0 ..
      make install
    done
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
