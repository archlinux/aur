# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-libxcb
pkgver=1.17.0
pkgrel=1
arch=('any')
pkgdesc="X11 client-side library (Android ${_android_arch})"
url="https://xcb.freedesktop.org/"
license=('custom')
depends=("android-${_android_arch}-xcb-proto"
         "android-${_android_arch}-libxdmcp"
         "android-${_android_arch}-libxau")
makedepends=('android-configure'
             "android-${_android_arch}-libxslt"
             "android-${_android_arch}-xorg-util-macros"
             "android-${_android_arch}-xorgproto"
             'python')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://xorg.freedesktop.org/archive/individual/lib/libxcb-${pkgver}.tar.xz")
md5sums=('96565523e9f9b701fcb35d31f1d4086e')

build() {
    cd "${srcdir}/libxcb-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-xinput \
        --enable-xkb \
        --disable-devel-docs \
        --without-doxygen
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libxcb-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
