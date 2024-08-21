# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-librsvg
pkgver=2.58.3
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
makedepends=('android-configure'
             'android-rust')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://gitlab.gnome.org/GNOME/librsvg/-/archive/${pkgver}/librsvg-${pkgver}.tar.bz2")
md5sums=('285238be66277c056c4456e779038407')

prepare() {
    cd "${srcdir}/librsvg-${pkgver}"
    source android-rust-env ${_android_arch}
    android_rust_prepare

    NOCONFIGURE=1 ./autogen.sh
}

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2

build() {
    cd "${srcdir}/librsvg-${pkgver}"
    source android-rust-env ${_android_arch}

    export RST2MAN=no
    export GI_DOCGEN=no

    android-${_android_arch}-configure \
        --enable-introspection=no \
        --disable-gtk-doc
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/librsvg-${pkgver}"
    source android-rust-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/"{doc,man}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
