# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-pango
pkgver=1.52.2
pkgrel=1
arch=('any')
pkgdesc="A library for layout and rendering of text (Android ${_android_arch})"
url="https://www.pango.org/"
license=('LGPL-2.1-or-later')
depends=("android-${_android_arch}-cairo"
         "android-${_android_arch}-fribidi"
         "android-${_android_arch}-harfbuzz"
         "android-${_android_arch}-libthai"
         "android-${_android_arch}-libxft")
makedepends=('android-meson'
             'gobject-introspection')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.gnome.org/GNOME/pango/-/archive/$pkgver/pango-$pkgver.tar.bz2")
md5sums=('0be3c92b57b623eb499bce3db58bef6a')

build() {
    cd "${srcdir}/pango-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build
    cd build
    android-${_android_arch}-meson
    ninja
}

package() {
    cd "${srcdir}/pango-${pkgver}/build"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
