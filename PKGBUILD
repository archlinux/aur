pkgname=mingw-w64-libharu
pkgver=2.3.0
pkgrel=1
pkgdesc="C library for generating PDF documents (mingw-w64)"
url="https://github.com/libharu/libharu"
arch=('any')
license=('custom:ZLIB')
depends=('mingw-w64-crt' 'mingw-w64-libpng')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/libharu/libharu/archive/RELEASE_${pkgver//./_}.tar.gz")
md5sums=('4f916aa49c3069b3a10850013c507460')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libharu-RELEASE_${pkgver//./_}"
  sed -i "s|WIN32 AND NOT CYGWIN|WIN32 AND NOT CYGWIN AND NOT MINGW|g" src/CMakeLists.txt
  sed -i "s|install(DIRECTORY if DESTINATION .)|message(STATUS hello)|g" CMakeLists.txt
  sed -i "s|install(FILES README CHANGES INSTALL DESTINATION .)|message(STATUS hello)|g" CMakeLists.txt
  rm -f src/hpdf_shading.c && curl -L https://github.com/libharu/libharu/pull/157.patch | patch -p1
}

build() {
  cd "$srcdir/libharu-RELEASE_${pkgver//./_}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libharu-RELEASE_${pkgver//./_}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
