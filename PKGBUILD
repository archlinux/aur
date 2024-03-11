# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

_android_arch=aarch64

pkgname=android-${_android_arch}-libxslt
pkgver=1.1.39
pkgrel=2
arch=('any')
pkgdesc="XML stylesheet transformation library (Android, ${_android_arch})"
url="https://gitlab.gnome.org/GNOME/libxslt/-/wikis/home"
license=('custom:MIT')
depends=("android-${_android_arch}-libgcrypt"
         "android-${_android_arch}-libxml2"
         "android-${_android_arch}-xz"
         'android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.gnome.org/GNOME/libxslt/-/archive/v${pkgver}/libxslt-v${pkgver}.tar.gz")
md5sums=('8058ddbcae9bc4a6ab75327e748561de')

prepare() {
    cd "$srcdir/libxslt-v$pkgver"
    source android-env ${_android_arch}

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "$srcdir/libxslt-v$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --without-python
    make $MAKEFLAGS
}

package() {
    cd "$srcdir/libxslt-v$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_BIN}"
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}/doc"
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}/gtk-doc"
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}/man"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
