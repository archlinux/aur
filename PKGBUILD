# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libxrandr
pkgver=1.5.5
pkgrel=1
arch=('any')
pkgdesc="X11 RandR extension library (Android ${_android_arch})"
license=('custom')
url="https://xorg.freedesktop.org/"
depends=("android-${_android_arch}-libxext"
         "android-${_android_arch}-libxrender"
         "android-${_android_arch}-libx11")
makedepends=("android-${_android_arch}-xorg-util-macros"
             "android-${_android_arch}-xorgproto")
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/lib/libXrandr-${pkgver}.tar.xz")
md5sums=('b550dfa388292a821aecdd52acecc94c')

build() {
    cd "${srcdir}/libXrandr-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --enable-malloc0returnsnull=no
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libXrandr-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
