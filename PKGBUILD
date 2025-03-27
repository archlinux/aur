# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-libdc1394
pkgver=2.2.7
pkgrel=2
arch=('any')
pkgdesc="Library to control IEEE 1394 based cameras (Android ${_android_arch})"
url='https://damien.douxchamps.net/ieee1394/libdc1394/'
license=('LGPL-2.1-or-later')
groups=('android-libdc1394')
depends=("android-${_android_arch}-libraw1394"
         "android-${_android_arch}-libusb")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/libdc1394/libdc1394-${pkgver}.tar.gz")
md5sums=('003856054d39f12c18ab9e0f1e527e2c')

prepare() {
    cd "${srcdir}/libdc1394-${pkgver}"

    sed -i 's|__u32 buffer\[cam->max_response_quads\]|__u32 buffer[512]|g' dc1394/juju/control.c
    sed -i 's|__u32 headers\[craw->packets_per_frame\*2 + 16\]|__u32 headers[1040]|g' dc1394/juju/capture.c
}

build() {
    cd "${srcdir}/libdc1394-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-doxygen-doc \
        --disable-sdltest \
        --disable-examples
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libdc1394-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
