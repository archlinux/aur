# Maintainer: David Schury <dasc@posteo.de>
pkgname=mingw-w64-libsigc++
_pkgname=libsigc++
pkgver=2.8.0
pkgrel=1
pkgdesc="Libsigc++ implements a full callback system for use in widget libraries - V2 (mingw-w64)"
arch=('any')
url="http://libsigc.sourceforge.net/"
license=('LGPL')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/${pkgver%.*}/$_pkgname-${pkgver}.tar.xz")
md5sums=('3d26acbc813fa54edd4401ce1a981677')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/$_pkgname-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --enable-shared \
      --enable-static \
      --disable-documentation
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
