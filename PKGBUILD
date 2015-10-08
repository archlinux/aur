pkgname=mingw-w64-libjpeg-turbo
pkgver=1.4.2
pkgrel=1
arch=(any)
pkgdesc="JPEG image codec with accelerated baseline compression and decompression (mingw-w64)"
license=("custom" "GPL")
depends=(mingw-w64-crt libjpeg-turbo)
makedepends=(nasm mingw-w64-cmake)
provides=(mingw-w64-libjpeg)
conflicts=(mingw-w64-libjpeg mingw-w64-libjpeg6-turbo)
options=(staticlibs !strip !buildflags)
url="http://libjpeg-turbo.virtualgl.org"
source=("http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-$pkgver.tar.gz"
"0001-header-compat.mingw.patch"
"libjpeg-turbo-1.3.1-libmng-compatibility.patch")
sha1sums=('2666158ccd5318513f875867bbc4af52f6eb9f0b'
          '204f9a62bb7170f54b1a997059fa77b9b02a71ba'
          '35413e30c3ea18839f4a023283a0bd444136839f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd libjpeg-turbo-$pkgver
	patch -p1 -i ${srcdir}/0001-header-compat.mingw.patch
  patch -p1 -i ${srcdir}/libjpeg-turbo-1.3.1-libmng-compatibility.patch
}

build() {
	cd libjpeg-turbo-$pkgver
	for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_JPEG8=ON \
      ..
    make
    popd
  done
}

package() {
	for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ln -s /usr/include/jpegint.h "$pkgdir/usr/${_arch}/include/jpegint.h"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/doc"
  done
}
