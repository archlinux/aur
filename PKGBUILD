# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=x86-64

pkgname=android-${_android_arch}-glib2
pkgver=2.84.3
pkgrel=1
arch=('any')
pkgdesc="Low level core library (Android ${_android_arch})"
url="https://wiki.gnome.org/Projects/GLib"
license=('LGPL2.1')
groups=('android-glib2')
depends=("android-${_android_arch}-libffi"
         "android-${_android_arch}-pcre2"
         "android-${_android_arch}-gettext"
         "android-${_android_arch}-zlib")
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://download.gnome.org/sources/glib/${pkgver%.*}/glib-${pkgver}.tar.xz")
md5sums=('8f61227d9a981f435841dca7666715fe')

build() {
    cd "${srcdir}/glib-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -Dtests=false
    ninja -C build
}

package() {
    cd "${srcdir}/glib-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true

    files=(gapplication
           gdbus
           gi-compile-repository
           gi-decompile-typelib
           gi-inspect-typelib
           gio
           gio-querymodules
           glib-compile-resources
           glib-compile-schemas
           gobject-query
           gresource
           gsettings
           gtester)

    for f in "${files[@]}"; do
        rm -f "${pkgdir}/${ANDROID_PREFIX_BIN}/$f"
    done

    rm -f "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/libintl.h"
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}/libintl.a"
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}/libintl.so"
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}/gio-launch-desktop"
}
