# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

pkgname=(
    lib32-gupnp
)
pkgver=1.6.6
pkgrel=1
pkgdesc="GObject-based UPNP framework (32-bit)"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/GUPnP"
license=(LGPL)
depends=(
    lib32-gssdp
    gupnp
)
makedepends=(
    git
    gobject-introspection
    meson
    vala
)
_commit=78db66f6af9879b93db8eb6452acb24a1aaac71c  # tags/gupnp-1.6.6^0
source=("git+https://gitlab.gnome.org/GNOME/gupnp.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd gupnp

    git describe --tags | sed 's/^gupnp-//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
    cd gupnp
}

build() {
    local meson_options=(
        --libdir='/usr/lib32' \
        -Dgtk_doc=false \
        -Dintrospection=false \
        -Dexamples=false
    )

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson gupnp build "${meson_options[@]}"


    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"

    rm -rf "${pkgdir}"/usr/{bin,include,share}
}
