# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: xantares

pkgname=mingw-w64-libzip
pkgver=1.8.0
pkgrel=1
pkgdesc="A C library for reading, creating, and modifying zip archives (mingw-w64)"
url="http://www.nih.at/libzip/index.html"
license=('BSD')
arch=(any)
depends=('mingw-w64-xz' 'mingw-w64-zlib' 'mingw-w64-bzip2' 'mingw-w64-openssl' 'mingw-w64-gnutls')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.nih.at/libzip/libzip-${pkgver}.tar.xz")
sha256sums=('f0763bda24ba947e80430be787c4b068d8b6aa6027a26a19923f0acfa3dac97e')

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

