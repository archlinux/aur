# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-pango
pkgver=1.56.4
pkgrel=1
arch=('any')
pkgdesc="A library for layout and rendering of text (Android ${_android_arch})"
url="https://www.pango.org/"
license=('LGPL-2.1-or-later')
groups=('android-pango')
depends=("android-${_android_arch}-cairo"
         "android-${_android_arch}-fribidi"
         "android-${_android_arch}-harfbuzz"
         "android-${_android_arch}-libthai"
         "android-${_android_arch}-libxft")
makedepends=('android-meson'
             'gobject-introspection')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.gnome.org/GNOME/pango/-/archive/${pkgver}/pango-${pkgver}.tar.bz2")
md5sums=('235135d7f48304ee5f95af1a249bc3ff')

build() {
    cd "${srcdir}/pango-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build
    ninja -C build
}

package() {
    cd "${srcdir}/pango-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja install -C build
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
