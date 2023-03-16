# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=mediastreamer
pkgver=5.2.32
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL)
depends=(ortp ffmpeg bzrtp glew libsrtp bcg729 libyuv zxing-cpp)
makedepends=(cmake python bcunit doxygen)
source=(https://gitlab.linphone.org/BC/public/${pkgname}2/-/archive/$pkgver/${pkgname}2-$pkgver.tar.bz2
        ffmpeg5.patch)
sha256sums=('5287024c370eb1cc9803c41e31e84026c54887fa6454f6c9af81bb6eac3db6ac'
            'e97e029cbbafe5245eaa6f92664224e4381eea5f45e403d5bfa6b0e5c2be0341')

prepare() {
  patch -d ${pkgname}2-$pkgver -p1 < ffmpeg5.patch
}

build() {
  cmake -B build -S ${pkgname}2-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=OFF \
    -DENABLE_STRICT=OFF \
    -DENABLE_UNIT_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/include/OpenGL
}
