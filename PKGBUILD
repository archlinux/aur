# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=gupnp-igd
pkgname=lib32-gupnp-igd
pkgver=1.2.0
pkgrel=2
pkgdesc="A library to handle UPnP IGD port mapping (32-bit)"
url="https://wiki.gnome.org/Projects/GUPnP"
arch=(x86_64)
license=(LGPL)
depends=(lib32-gupnp gupnp-igd)
makedepends=(git gobject-introspection meson)
_commit=a0aafc79ac8e258f849cdb2924cb11ec9162d0c5  # tags/1.2.0-correct^0
source=("git+https://gitlab.gnome.org/GNOME/gupnp-igd.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/-correct//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
    cd $_basename

    # GUPnP 1.6
    git cherry-pick -n 649b7100339c57531a8e31f69220f8e17f0860e0 \
                       79a1e4cf8c256132978a1d8ab718c8ad132386de
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson $_basename build \
        --libdir='/usr/lib32' \
        -Dgtk_doc=false \
        -Dintrospection=false

    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs || :
}

package() {
    meson install -C build --destdir "$pkgdir"

    rm -rf "${pkgdir}"/usr/{bin,include,share}
}

