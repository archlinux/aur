# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-a52dec
pkgver=0.8.0
pkgrel=1
pkgdesc="Library for decoding ATSC A/52 (AC-3) audio streams (Android ${_android_arch})"
arch=('any')
url='https://git.adelielinux.org/community/a52dec/'
license=('GPL-2.0-or-later')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://distfiles.adelielinux.org/source/a52dec/a52dec-${pkgver}.tar.gz")
md5sums=('4debeed0257f5312e84d92711a5cfcec')

build() {
    cd "${srcdir}/a52dec-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-oss
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/a52dec-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    install -m644 liba52/a52_internal.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/a52dec/"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
