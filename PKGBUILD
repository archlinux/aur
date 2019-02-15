# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libjpeg-turbo
pkgver=2.0.2
pkgrel=1
arch=(any)
pkgdesc="JPEG image codec with accelerated baseline compression and decompression (mingw-w64)"
license=("custom")
depends=(mingw-w64-crt)
makedepends=(yasm mingw-w64-cmake)
provides=(mingw-w64-libjpeg)
conflicts=(mingw-w64-libjpeg mingw-w64-libjpeg6-turbo)
options=(staticlibs !strip !buildflags)
url="http://libjpeg-turbo.virtualgl.org"
source=("http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-$pkgver.tar.gz")
validpgpkeys=('7D6293CC6378786E1B5C496885C7044E033FDE16')
sha256sums=('acb8599fe5399af114287ee5907aea4456f8f2c1cc96d26c28aebfdf5ee82fed')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/libjpeg-turbo-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DWITH_JPEG8=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libjpeg-turbo-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
