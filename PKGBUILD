# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-librsvg
pkgver=2.59.2
pkgrel=1
arch=('any')
pkgdesc="SVG rendering library (Android ${_android_arch})"
url="https://wiki.gnome.org/Projects/LibRsvg"
license=('LGPL-2.1-or-later')
groups=('android-librsvg')
depends=("android-${_android_arch}-cairo"
         "android-${_android_arch}-freetype2"
         "android-${_android_arch}-gdk-pixbuf2"
         "android-${_android_arch}-glib2"
         "android-${_android_arch}-harfbuzz"
         "android-${_android_arch}-libxml2"
         "android-${_android_arch}-pango")
makedepends=('android-meson'
             'android-rust')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.gnome.org/GNOME/librsvg/-/archive/${pkgver}/librsvg-${pkgver}.tar.bz2")
md5sums=('f899eab00948aea436debd1e392db1ba')

prepare() {
    cd "${srcdir}/librsvg-${pkgver}"
    source android-rust-env ${_android_arch}
    android_rust_prepare
}

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2

build() {
    cd "${srcdir}/librsvg-${pkgver}"
    source android-rust-env ${_android_arch}

    android-${_android_arch}-meson build \
        -D triplet=${RUST_TARGET} \
        -D introspection=disabled \
        -D pixbuf-loader=disabled \
        -D docs=disabled \
        -D tests=false
    ninja -C build
}

package() {
    cd "${srcdir}/librsvg-${pkgver}"
    source android-rust-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/"{doc,man}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
