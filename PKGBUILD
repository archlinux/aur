pkgname=mingw-w64-libcerf
pkgver=2.4
pkgrel=1
arch=(any)
url="https://jugit.fz-juelich.de/mlz/libcerf/"
pkgdesc="Self-contained numeric library that provides an efficient and accurate implementation of complex error functions (mingw-w64)"
license=('MIT')
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake)
options=('!buildflags' 'staticlibs' '!strip')
source=(git+https://jugit.fz-juelich.de/mlz/libcerf.git#tag=v$pkgver)
sha256sums=('6970f3c2a99f6ed4f5de6e91e2bfeea338b6d5e424a4d26a05e7978825a41273')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}"/libcerf

  # install dll into /bin
  sed -i "s|RUNTIME DESTINATION \${CMAKE_INSTALL_LIBDIR}|RUNTIME DESTINATION \${CMAKE_INSTALL_BINDIR}|g" lib/CMakeLists.txt

  # dont build tests
  rm test/*.c
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
