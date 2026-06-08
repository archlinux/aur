# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=mediastreamer
pkgver=5.4.119
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(AGPL-3.0-only)
depends=(bcmatroska2 bcg729 bzrtp gsm glew libtheora libpulse libsrtp libvpx libxfixes libxinerama libxv libyuv opus ortp speex speexdsp zxing-cpp)
makedepends=(cmake python bcunit doxygen)
source=(https://gitlab.linphone.org/BC/public/${pkgname}2/-/archive/$pkgver/${pkgname}2-$pkgver.tar.gz
    fix-build-ffmpeg5.patch
    fix-zxing-cpp-3.patch)
sha256sums=('cedadc10ca42c03ed47d7043cafa44f494a2fed6f134011485e8e1204d118db6'
            'a069ca2db409ec60010b10357a9f081809f521a9c0306f89bd49bb16121acfc1'
            'dfcb2d1060192d4c2217f84e56e49216e60aab74bf28d8a8b14972e88fb66e87')

prepare() {
    cd "${pkgname}2-${pkgver}"
    patch -p1 < "${srcdir}/fix-build-ffmpeg5.patch"
    patch -p1 < "${srcdir}/fix-zxing-cpp-3.patch"
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
