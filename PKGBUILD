pkgname=mingw-w64-suitesparse
pkgver=6.0.1
pkgrel=1
pkgdesc="A collection of sparse matrix libraries (mingw-w64)"
url="https://people.engr.tamu.edu/davis/suitesparse.html"
arch=('any')
depends=('mingw-w64-lapack' 'mingw-w64-mpfr')
makedepends=('mingw-w64-cmake')
license=('GPL')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v${pkgver}.tar.gz")
sha256sums=('06f55a0449775d1f43d8a33ba8c8417ea8cf76c27833b465c49825baa8741d0c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_subdirectories="SuiteSparse_config Mongoose AMD BTF CAMD CCOLAMD COLAMD CHOLMOD CXSparse LDL KLU UMFPACK RBio SuiteSparse_GPURuntime GPUQREngine SPQR SPEX GraphBLAS"

prepare () {
  cd "$srcdir"/SuiteSparse-${pkgver}

  # undefined refs to gcov
  sed -i "s|SET(CMAKE_EXE_LINKER_FLAGS_DEBUG|#SET(CMAKE_EXE_LINKER_FLAGS_DEBUG|g" Mongoose/CMakeLists.txt
  sed -i "s|SET(CMAKE_CXX_FLAGS_DEBUG|#SET(CMAKE_CXX_FLAGS_DEBUG|g" Mongoose/CMakeLists.txt
  sed -i "s|SET(CMAKE_C_FLAGS_DEBUG|#SET(CMAKE_C_FLAGS_DEBUG|g" Mongoose/CMakeLists.txt

  # https://github.com/DrTimothyAldenDavis/GraphBLAS/issues/181
  sed -i "s|#define GB_COMPILER_MINGW   0|#define GB_COMPILER_MINGW   1|g" GraphBLAS/Source/GB_compiler.h

  # https://github.com/DrTimothyAldenDavis/SuiteSparse/issues/183
  sed -i "/VERSION_VAR/d" */cmake_modules/Find*.cmake

  # undefined reference to dlarfg_
  echo "target_link_libraries (spqr PUBLIC \${LAPACK_LIBRARIES})" >> SPQR/CMakeLists.txt

  # undefined reference to cholmod_l_metis
  echo "add_compile_definitions (NPARTITION)" >> SPQR/CMakeLists.txt
}

build() {
  cd "$srcdir"
  # using CMAKE_STAGING_PREFIX ...
}

package() {
  for _arch in ${_architectures}; do
    for _subdir in ${_subdirectories}; do
      cd "$srcdir/SuiteSparse-${pkgver}/${_subdir}"
      mkdir -p build-${_arch} && cd build-${_arch}
      ${_arch}-cmake -DNPARTITION=1 -DBLA_VENDOR=Generic -DCMAKE_STAGING_PREFIX="$pkgdir"/usr/${_arch} ..
      make install
    done
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
