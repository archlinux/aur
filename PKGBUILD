# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Daniel Nagy <danielnagy at gmx de>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libde265
pkgver=1.0.15
pkgrel=2
arch=('any')
pkgdesc="Open h.265 video codec implementation (Android ${_android_arch})"
url='https://github.com/strukturag/libde265'
license=('LGPL3')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/strukturag/libde265/releases/download/v${pkgver}/libde265-${pkgver}.tar.gz")
md5sums=('d61e9fb8052b8d90d76ab67fd84e018d')

build() {
    cd "${srcdir}/libde265-${pkgver}"
    source android-env ${_android_arch}

    extra_options=

    case "${_android_arch}" in
        armv7a-eabi)
            extra_options=--disable-arm
            ;;
        *)
            ;;
    esac

    export CFLAGS="${CFLAGS} -fPIC"
    export CXXFLAGS="${CXXFLAGS} -fPIC"

    android-${_android_arch}-configure \
        --disable-dec265 \
        --disable-sherlock265 \
        ${extra_options}
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libde265-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
