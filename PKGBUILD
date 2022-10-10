pkgname=mingw-w64-suitesparse
pkgver=5.13.0
pkgrel=1
pkgdesc="A collection of sparse matrix libraries (mingw-w64)"
url="https://people.engr.tamu.edu/davis/suitesparse.html"
arch=('any')
depends=('mingw-w64-lapack' 'mingw-w64-metis' 'mingw-w64-mpfr')
makedepends=('mingw-w64-cmake' 'mingw-w64-make')
license=('GPL')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v${pkgver}.tar.gz")
sha256sums=('59c6ca2959623f0c69226cf9afb9a018d12a37fab3a8869db5f6d7f83b6b147d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare () {
  cd "$srcdir"/SuiteSparse-${pkgver}

  # no demos
  sed -i "s|default: all|default: library|g" */Makefile
  sed -i "s|all: C cov|all: library|g" */Makefile
  sed -i 's|; ./bin/demo||g' Mongoose/Makefile

  # undefined refs to gcov
  sed -i "s|SET(CMAKE_EXE_LINKER_FLAGS_DEBUG|#SET(CMAKE_EXE_LINKER_FLAGS_DEBUG|g" Mongoose/CMakeLists.txt
  sed -i "s|SET(CMAKE_CXX_FLAGS_DEBUG|#SET(CMAKE_CXX_FLAGS_DEBUG|g" Mongoose/CMakeLists.txt
  sed -i "s|SET(CMAKE_C_FLAGS_DEBUG|#SET(CMAKE_C_FLAGS_DEBUG|g" Mongoose/CMakeLists.txt

  # related to mingw
  curl -L https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-suitesparse/0001-mingw-w64-Use-a-not-lib-as-AR_TARGET-extension.patch | patch -p1
  curl -L https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-suitesparse/0002-mingw-w64-Set-SO_OPTS--shared-move-dlls-create-import-libs.patch | patch -p1
  curl -L https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-suitesparse/0004-mingw-w64-install-static-libs.patch | patch -p1
  sed -i 's| \-lsuitesparseconfig| \-L../../lib \-lsuitesparseconfig \-lssp|g' */Lib/Makefile

  # x86_64 conversion errors
  curl -L https://github.com/ScottKolo/Mongoose/pull/4.patch | patch -p1 -d Mongoose

  # sliplu is weirder
  sed -i "s|default: C|default: library|g" SLIP_LU/Makefile
  sed -i "/SO_PLAIN/d" SLIP_LU/Lib/Makefile
  sed -i "/SO_MAIN/d" SLIP_LU/Lib/Makefile

  # use MAKEFLAGS instead of JOBS
  sed -i "s| --jobs=\$(JOBS)||g" */Makefile

  # disable cpu_features
  curl -L https://github.com/DrTimothyAldenDavis/GraphBLAS/pull/118.patch | patch -p1 -d GraphBLAS

  # install graphblas & mongoose dll
  curl -L https://github.com/DrTimothyAldenDavis/SuiteSparse/pull/123.patch | patch -p1
  curl -L https://github.com/DrTimothyAldenDavis/GraphBLAS/pull/119.patch | patch -p1 -d GraphBLAS
}

build() {
  cd "$srcdir"
  for _arch in ${_architectures}; do
    cp -r SuiteSparse-${pkgver} build-${_arch} && pushd build-${_arch}
    ${_arch}-make \
      UNAME=Windows BLAS="-llapack -lblas -lgfortran -lquadmath" \
      CMAKE_OPTIONS="-DCMAKE_INSTALL_PREFIX=\"/usr/${_arch}\" -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=\"/usr/share/mingw/toolchain-${_arch}.cmake\"" \
      MY_METIS_LIB="-lmetis"
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    install -dm755 "${pkgdir}"/usr/${_arch}/{bin,lib,include/suitesparse}
    cd "${srcdir}"/build-${_arch}
    ${_arch}-make install \
      UNAME=Windows BLAS="-llapack -lblas -lgfortran -lquadmath" \
      CMAKE_OPTIONS="-DCMAKE_INSTALL_PREFIX=\"/usr/${_arch}\" -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=\"/usr/share/mingw/toolchain-${_arch}.cmake\"" \
      MY_METIS_LIB="-lmetis" \
      DESTDIR="${pkgdir}" INSTALL="${pkgdir}"/usr/${_arch}
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    rm -rf "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
