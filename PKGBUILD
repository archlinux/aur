# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-librsvg
pkgver=2.61.3
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
md5sums=('657ad5b49f91564b77f99a9458ade171')

prepare() {
    cd "${srcdir}/librsvg-${pkgver}"
    source android-rust-env ${_android_arch}
    android_rust_prepare
}

export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=$(nproc)

build() {
    cd "${srcdir}/librsvg-${pkgver}"
    source android-rust-env ${_android_arch}

    android-${_android_arch}-meson build \
        -D triplet=${RUST_TARGET} \
        -D introspection=disabled \
        -D pixbuf-loader=disabled \
        -D rsvg-convert=disabled \
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

    install -vDm 644 COPYING.LIB -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
