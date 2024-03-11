# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-libxcb
pkgver=1.16.1
pkgrel=2
arch=('any')
pkgdesc="X11 client-side library (Android, ${_android_arch})"
url="https://xcb.freedesktop.org/"
license=('custom')
depends=("android-${_android_arch}-xcb-proto"
         "android-${_android_arch}-libxdmcp"
         "android-${_android_arch}-libxau")
makedepends=('android-configure'
             'python'
             "android-${_android_arch}-libxslt"
             "android-${_android_arch}-xorg-util-macros"
             "android-${_android_arch}-xorgproto")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://xorg.freedesktop.org/archive/individual/lib/libxcb-$pkgver.tar.xz")
md5sums=('e60f0fd3c06e4628be4141bcb3a27f9a')

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
