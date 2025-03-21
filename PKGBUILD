# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-libmpeg2
pkgver=0.5.1
pkgrel=2
pkgdesc="Library for decoding MPEG-1 and MPEG-2 video streams (Android ${_android_arch})"
arch=('any')
url='https://libmpeg2.sourceforge.io/'
license=('GPL-2.0-or-later')
groups=('android-libmpeg2')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://libmpeg2.sourceforge.io/files/libmpeg2-${pkgver}.tar.gz")
md5sums=('0f92c7454e58379b4a5a378485bbd8ef')

prepare() {
    cd "${srcdir}/libmpeg2-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fiv

    case "${_android_arch}" in
        armv7a-eabi)
            # Disable ARM v7 assembly optimizations

            sed -i 's|${arm_conditional}|false|g' configure
            sed -i '/#define ARCH_ARM/d' configure
            ;;
    esac
}

build() {
    cd "${srcdir}/libmpeg2-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-sdl \
        --without-x
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libmpeg2-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
