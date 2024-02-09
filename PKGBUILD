# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=x86-64

pkgname=android-${_android_arch}-glib2
pkgver=2.78.3
pkgrel=1
pkgdesc="Low level core library (android)"
arch=('any')
url="https://wiki.gnome.org/Projects/GLib"
license=("LGPL2.1")
depends=("android-${_android_arch}-libffi"
         "android-${_android_arch}-pcre2"
         "android-${_android_arch}-gettext"
         "android-${_android_arch}-zlib")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-meson')
source=("https://download.gnome.org/sources/glib/${pkgver%.*}/glib-${pkgver}.tar.xz"
        '0001-Fix-build.patch')
sha256sums=('609801dd373796e515972bf95fc0b2daa44545481ee2f465c4f204d224b2bc21'
            '26ec88e5fe6f13a5ea024384a01eb6f9ac2d1e93bdb4e47641339963c187353c')

prepare() {
    cd "${srcdir}"/glib-${pkgver}

    patch -Np1 -i ../0001-Fix-build.patch
}

build() {
    cd "${srcdir}"/glib-${pkgver}
    source android-env ${_android_arch}

    export C_INCLUDE_PATH="${ANDROID_PREFIX_INCLUDE}"
    export LIBRARY_PATH="${ANDROID_PREFIX_LIB}"

    for type in static shared; do
        rm -rf "${srcdir}/glib-${pkgver}/build-${_android_arch}-${type}"
        mkdir -p "${srcdir}/glib-${pkgver}/build-${_android_arch}-${type}"
        cd "${srcdir}/glib-${pkgver}/build-${_android_arch}-${type}"
        android-${_android_arch}-meson \
            --default-library "${type}" \
            ..
        ninja
    done
}

package() {
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C "${srcdir}/glib-${pkgver}/build-${_android_arch}-static" install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/glib-${pkgver}/build-${_android_arch}-shared" install

    rm -rf "${pkgdir}"/${ANDROID_PREFIX_BIN}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    #${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
