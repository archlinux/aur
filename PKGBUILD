# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-libusb
pkgver=1.0.28
pkgrel=1
arch=('any')
pkgdesc="Library that provides generic access to USB devices (Android ${_android_arch})"
url="https://libusb.info/"
license=('LGPL-2.1-or-later')
groups=('android-libusb')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libusb/libusb/releases/download/v${pkgver}/libusb-${pkgver}.tar.bz2")
md5sums=('4022135a84975b292cf48381fbc8ffd8')

prepare() {
    cd "${srcdir}/libusb-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fiv
}

build() {
    cd "${srcdir}/libusb-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-udev=no
    make $MAKEFLAGS
}

package () {
    cd "${srcdir}/libusb-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
