
pkgname=mingw-w64-libzip
pkgver=1.1.3
pkgrel=1
pkgdesc="A C library for reading, creating, and modifying zip archives (mingw-w64)"
url="http://www.nih.at/libzip/index.html"
license=('BSD')
arch=(any)
depends=('mingw-w64-crt' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.nih.at/libzip/libzip-${pkgver}.tar.xz"
        'libzip_cmake-fixes.patch')
md5sums=('f7196e2fbae93d7e1f843aedee9bdf40'
         '7d7862d2f5c68066b055c7b3ad0796a3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libzip-${pkgver}"
  patch -p1 -i "$srcdir/libzip_cmake-fixes.patch"
}

build() {
  cd "$srcdir/libzip-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libzip-${pkgver}/build-$_arch"
    make DESTDIR="${pkgdir}" install
    ln -s /usr/${_arch}/lib/libzip/include/zipconf.h "$pkgdir"/usr/${_arch}/include/zipconf.h
    rm -r "$pkgdir"/usr/${_arch}/share/
    rm "$pkgdir"/usr/${_arch}/bin/*.exe 
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

