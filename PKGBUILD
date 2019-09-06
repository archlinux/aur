pkgname=mingw-w64-suitesparse
pkgver=5.4.0
pkgrel=1
pkgdesc="A collection of sparse matrix libraries (mingw-w64)"
url="http://www.cise.ufl.edu/research/sparse/SuiteSparse/"
arch=('any')
depends=('mingw-w64-lapack' 'mingw-w64-metis')
makedepends=('mingw-w64-gcc')
license=('GPL')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-${pkgver}.tar.gz")
sha256sums=('374dd136696c653e34ef3212dc8ab5b61d9a67a6791d5ec4841efb838e94dbd1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/SuiteSparse

  # no demos
  curl -L https://git.archlinux.org/svntogit/packages.git/plain/trunk/suitesparse-no-demo.patch?h=packages/suitesparse | patch -p1
  sed -i "s|default: all|default: library|g" */Makefile

  # undefined refs to gcov
  sed -i "s|SET(CMAKE_EXE_LINKER_FLAGS_DEBUG|#SET(CMAKE_EXE_LINKER_FLAGS_DEBUG|g" Mongoose/CMakeLists.txt
  sed -i "s|SET(CMAKE_CXX_FLAGS_DEBUG|#SET(CMAKE_CXX_FLAGS_DEBUG|g" Mongoose/CMakeLists.txt
  sed -i "s|SET(CMAKE_C_FLAGS_DEBUG|#SET(CMAKE_C_FLAGS_DEBUG|g" Mongoose/CMakeLists.txt

  # related to mingw
  curl -L https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-suitesparse/0001-mingw-w64-Use-a-not-lib-as-AR_TARGET-extension.patch | patch -p1
  curl -L https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-suitesparse/0002-mingw-w64-Set-SO_OPTS--shared-move-dlls-create-import-libs.patch | patch -p1
  curl -L https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-suitesparse/0004-mingw-w64-install-static-libs.patch | patch -p1
}

build() {
  cd "$srcdir"
  for _arch in ${_architectures}; do
    cp -r SuiteSparse build-${_arch} && pushd build-${_arch}
    make \
      UNAME=Windows CC=${_arch}-gcc CXX=${_arch}-g++ F77=${_arch}-gfortran \
      AR=${_arch}-ar RANLIB=${_arch}-ranlib BLAS="-lblas -lgfortran -lquadmath" \
      CFLAGS="-D_FORTIFY_SOURCE=2 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4" \
      CHOLMOD_CONFIG='-DNPARTITION' \
      CMAKE_OPTIONS="-DCMAKE_INSTALL_PREFIX=\"/usr/${_arch}\" -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=\"/usr/share/mingw/toolchain-${_arch}.cmake\"" \
      MY_METIS_LIB="-lmetis" JOBS=2
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    install -dm755 "${pkgdir}"/usr/${_arch}/{bin,lib,include/suitesparse}
    cd "${srcdir}"/build-${_arch} 
    make install \
      UNAME=Windows CC=${_arch}-gcc CXX=${_arch}-g++ F77=${_arch}-gfortran \
      AR=${_arch}-ar RANLIB=${_arch}-ranlib BLAS="-lblas -lgfortran -lquadmath" \
      CFLAGS="-D_FORTIFY_SOURCE=2 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4" \
      CHOLMOD_CONFIG='-DNPARTITION' \
      CMAKE_OPTIONS="-DCMAKE_INSTALL_PREFIX=\"/usr/${_arch}\" -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=\"/usr/share/mingw/toolchain-${_arch}.cmake\"" \
      MY_METIS_LIB="-lmetis" \
      DESTDIR="${pkgdir}" INSTALL="${pkgdir}"/usr/${_arch}
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    rm -rf "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

