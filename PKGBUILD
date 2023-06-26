# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=mediastreamer
pkgver=5.2.73
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(AGPL3)
depends=(bcmatroska2 bcg729 bzrtp ffmpeg glew libsrtp libyuv ortp zxing-cpp)
makedepends=(cmake python bcunit doxygen)
source=(https://gitlab.linphone.org/BC/public/${pkgname}2/-/archive/$pkgver/${pkgname}2-$pkgver.tar.bz2
        ffmpeg5.patch)
sha256sums=('1a1a03060f31280607934bddae451f0d4501c19482f04315565fc82db1679253'
            '7687516b61b33a89adf90790bc01e0a724160bcdd475706228ccbcd19891283a')

prepare() {
  patch -d ${pkgname}2-$pkgver -p1 < ffmpeg5.patch
}

build() {
  cmake -B build -S ${pkgname}2-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=OFF \
    -DENABLE_STRICT=OFF \
    -DENABLE_UNIT_TESTS=OFF \
    -DENABLE_MKV=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/include/OpenGL
}
