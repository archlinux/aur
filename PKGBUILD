# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: David Schury <dasc@posteo.de>

pkgname=mingw-w64-libsigc++
_pkgname=libsigc++
pkgver=2.10.2
pkgrel=1
epoch=1
pkgdesc="Libsigc++ implements a full callback system for use in widget libraries - V2 (mingw-w64)"
arch=('any')
url="https://libsigcplusplus.github.io/libsigcplusplus/"
license=('LGPL')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://ftp.gnome.org/pub/GNOME/sources/$_pkgname/${pkgver%.*}/$_pkgname-${pkgver}.tar.xz")
sha256sums=('b1ca0253379596f9c19f070c83d362b12dfd39c0a3ea1dd813e8e21c1a097a98')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/$_pkgname-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-documentation \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/$_pkgname-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
