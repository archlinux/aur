
pkgname=mingw-w64-libzip
pkgver=1.6.0
pkgrel=1
pkgdesc="A C library for reading, creating, and modifying zip archives (mingw-w64)"
url="http://www.nih.at/libzip/index.html"
license=('BSD')
arch=(any)
depends=('mingw-w64-xz' 'mingw-w64-zlib' 'mingw-w64-bzip2')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.nih.at/libzip/libzip-${pkgver}.tar.xz")
sha256sums=('a6cd804b4b3cffd997bd563fec693eb7eb052c225909a98a620689c2befb699b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libzip-${pkgver}"
}

build() {
  cd "$srcdir/libzip-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_DOC=OFF -DBUILD_EXAMPLES=OFF -DBUILD_REGRESS=OFF -DBUILD_TOOLS=OFF ..
    make
    popd
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake -DBUILD_DOC=OFF -DBUILD_EXAMPLES=OFF -DBUILD_REGRESS=OFF -DBUILD_TOOLS=OFF -DBUILD_SHARED_LIBS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libzip-${pkgver}/build-$_arch-static"
    make DESTDIR="${pkgdir}" install
    cd "$srcdir/libzip-${pkgver}/build-$_arch"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

