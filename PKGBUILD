pkgname=mingw-w64-libcerf
pkgver=3.3
pkgrel=1
arch=(any)
url="https://jugit.fz-juelich.de/mlz/libcerf/"
pkgdesc="Self-contained numeric library that provides an efficient and accurate implementation of complex error functions (mingw-w64)"
license=('MIT')
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake)
options=('!buildflags' 'staticlibs' '!strip')
source=(git+https://jugit.fz-juelich.de/mlz/libcerf.git#tag=v$pkgver)
sha256sums=('504fd78f65361b6a40a54be4dd48afdbb6c82eab73fff28dea7a2079df726644')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}"/libcerf

  # install dll into /bin
  sed -i "s|RUNTIME DESTINATION \${CMAKE_INSTALL_LIBDIR}|RUNTIME DESTINATION \${CMAKE_INSTALL_BINDIR}|g" cmake/buildLib.cmake

  # allow building  C variant
  sed -i "s|WIN32|MSVC|g" CMakeLists.txt
  sed -i "s|#    if _WIN32|#    if _MSC_VER|g" lib/cerf.h

  # dont build tests
  sed -i "/add_subdirectory(test/d" CMakeLists.txt
}

build() {
  cd "${srcdir}"/libcerf
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} -DLIB_MAN=OFF -DLIB_RUN=OFF -DBUILD_TESTING=OFF .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/libcerf/build-${_arch}
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
