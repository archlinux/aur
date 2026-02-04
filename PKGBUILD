# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libxinerama
pkgver=1.1.6
pkgrel=1
arch=('any')
pkgdesc="X11 Xinerama extension library (Android ${_android_arch})"
url="https://xorg.freedesktop.org/"
license=('custom')
depends=("android-${_android_arch}-libxext")
makedepends=("android-${_android_arch}-xorg-util-macros"
             "android-${_android_arch}-xorgproto")
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/archive/individual/lib/libXinerama-${pkgver}.tar.xz")
md5sums=('5f3f5754a40730d1518233a60ba5c48e')

build() {
    cd "${srcdir}/libXinerama-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-malloc0returnsnull
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libXinerama-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
