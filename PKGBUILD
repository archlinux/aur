# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=x86

pkgname=android-${_android_arch}-glib2
pkgver=2.78.4
pkgrel=2
arch=('any')
pkgdesc="Low level core library (Android, ${_android_arch})"
url="https://wiki.gnome.org/Projects/GLib"
license=("LGPL2.1")
groups=('android-glib2')
depends=("android-${_android_arch}-libffi"
         "android-${_android_arch}-pcre2"
         "android-${_android_arch}-gettext"
         "android-${_android_arch}-zlib")
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://download.gnome.org/sources/glib/${pkgver%.*}/glib-${pkgver}.tar.xz")
sha256sums=('24b8e0672dca120cc32d394bccb85844e732e04fe75d18bb0573b2dbc7548f63')

build() {
    cd "${srcdir}"/glib-${pkgver}
    source android-env ${_android_arch}

    for type in static shared; do
        rm -rf "${srcdir}/glib-${pkgver}/build-${_android_arch}-${type}"
        mkdir -p "${srcdir}/glib-${pkgver}/build-${_android_arch}-${type}"
        cd "${srcdir}/glib-${pkgver}/build-${_android_arch}-${type}"
        android-${_android_arch}-meson \
            --default-library "${type}" \
            -Dtests=false \
            ..
        ninja
    done
}

package() {
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C "${srcdir}/glib-${pkgver}/build-${_android_arch}-static" install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/glib-${pkgver}/build-${_android_arch}-shared" install

    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true

    rm -f "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/libintl.h"
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}/libintl.a"
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}/libintl.so"
}
