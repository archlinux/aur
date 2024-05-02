# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-libdc1394
pkgver=2.2.7
pkgrel=1
arch=('any')
pkgdesc="Library to control IEEE 1394 based cameras (Android ${_android_arch})"
url='https://damien.douxchamps.net/ieee1394/libdc1394/'
license=('LGPL-2.1-or-later')
depends=("android-${_android_arch}-libraw1394"
         "android-${_android_arch}-libusb")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/libdc1394/libdc1394-$pkgver.tar.gz")
sha256sums=('537ceb78dd3cef271a183f4a176191d1cecf85f025520e6bd3758b0e19e6609f')

prepare() {
    cd "${srcdir}/libdc1394-$pkgver"

    sed -i 's|__u32 buffer\[cam->max_response_quads\]|__u32 buffer[512]|g' dc1394/juju/control.c
    sed -i 's|__u32 headers\[craw->packets_per_frame\*2 + 16\]|__u32 headers[1040]|g' dc1394/juju/capture.c
}

build() {
    cd "${srcdir}/libdc1394-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-doxygen-doc \
        --disable-sdltest \
        --disable-examples
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libdc1394-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
