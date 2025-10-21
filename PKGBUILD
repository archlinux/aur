# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=mediastreamer
pkgver=5.4.50
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(AGPL-3.0-only)
depends=(bcmatroska2 bcg729 bzrtp gsm glew libtheora libpulse libsrtp libvpx libxfixes libxinerama libxv libyuv opus ortp speex speexdsp zxing-cpp)
makedepends=(cmake python bcunit doxygen)
source=(https://gitlab.linphone.org/BC/public/${pkgname}2/-/archive/$pkgver/${pkgname}2-$pkgver.tar.bz2)
sha256sums=('819f0160f2344660ff337537dcbe0b3b5a6c7628be0ed2f6684edd9b6ce332e5')

prepare() {
    cd "${pkgname}2-${pkgver}"
    patch -p1 < ../../fix-build-ffmpeg5.patch
}

build() {
  cmake -B build -S ${pkgname}2-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_STRICT=OFF \
    -DENABLE_UNIT_TESTS=OFF \
    -DENABLE_MKV=ON \
    -DENABLE_FFMPEG=OFF \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/include/OpenGL
}
