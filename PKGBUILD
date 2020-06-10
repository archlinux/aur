# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=libnice
pkgname=lib32-libnice
pkgver=0.1.17
pkgrel=1
pkgdesc="An implementation of the IETF's draft ICE (for p2p UDP data streams) (32-bit)"
url="https://nice.freedesktop.org"
arch=(x86_64)
license=(LGPL)
depends=(lib32-gstreamer lib32-gupnp-igd libnice)
makedepends=(git gobject-introspection meson)
_commit=5fb2511725a690a68ed9ace030931b78bc6fe92c  # tags/0.1.17^0
source=("git+https://gitlab.freedesktop.org/libnice/libnice.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/-/+/g'
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'
    export PKG_CONFIG_PATH='$PKG_CONFIG_PATH:/usr/lib32/pkgconfig/:/usr/lib/pkgconfig'

    arch-meson libnice build \
        --libdir='/usr/lib32' \
        -Dgtk_doc=disabled \
        -Dtests=disabled

    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="${pkgdir}" meson install -C build

    rm -rf "${pkgdir}"/usr/{bin,include,share}
}
