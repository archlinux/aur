# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=gupnp-igd
pkgname=lib32-gupnp-igd
pkgver=1.6.0
pkgrel=1
pkgdesc="A library to handle UPnP IGD port mapping (32-bit)"
url="https://wiki.gnome.org/Projects/GUPnP"
arch=(x86_64)
license=(LGPL)
depends=(lib32-gupnp gupnp-igd)
makedepends=(git gobject-introspection meson)
_commit=e60764858374d776869605d39e5e4d1033e9ad4a # tags/1.6.0^0
source=("git+https://gitlab.gnome.org/GNOME/gupnp-igd.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
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
