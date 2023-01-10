# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

pkgname=lib32-gupnp
pkgver=1.6.3
pkgrel=1
pkgdesc="An object-oriented UPNP framework (32-bit)"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/GUPnP"
license=(LGPL)
depends=(lib32-gssdp gupnp)
makedepends=(git gobject-introspection meson vala)
_commit=adb51197a7e3120027a295b36beda4571e628758 # tags/gupnp-1.6.3^0
source=("git+https://gitlab.gnome.org/GNOME/gupnp.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd gupnp

    git describe --tags | sed 's/^gupnp-//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
    cd gupnp

    # Unbreak man page build
    git revert -n 8795626a07963a91400773cfe04d4f2f1c37ff14
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson gupnp build \
        --libdir='/usr/lib32' \
        -Dgtk_doc=false \
        -Dintrospection=false \
        -Dexamples=false

    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"

    rm -rf "${pkgdir}"/usr/{bin,include,share}
}
