# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-libxcb
pkgver=1.16
pkgrel=1
arch=('any')
pkgdesc="X11 client-side library (android)"
url="https://xcb.freedesktop.org/"
depends=("android-${_android_arch}-xcb-proto"
         "android-${_android_arch}-libxdmcp"
         "android-${_android_arch}-libxau")
makedepends=('python'
             "android-${_android_arch}-libxslt"
             "android-${_android_arch}-xorg-util-macros"
             "android-${_android_arch}-xorgproto")
license=('custom')
options=(!strip !buildflags staticlibs !emptydirs)
source=(https://xorg.freedesktop.org/archive/individual/lib/libxcb-$pkgver.tar.xz{,.sig})
sha512sums=('002fbc126c6f09eb7db5e4197cd0572d495f64b6de714a76d9a024fe3e13122c1cfc7c55207c0dee76cc63fcccf87b37db513223eadaf760af2bd2a926443bf8'
            'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"

build() {
    cd "$srcdir/libxcb-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-xinput \
        --enable-xkb \
        --disable-devel-docs \
        --without-doxygen
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/libxcb-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
