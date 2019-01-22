# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=libnice
pkgname=lib32-libnice
pkgver=0.1.15
pkgrel=1
pkgdesc="An implementation of the IETF's draft ICE (for p2p UDP data streams) (32-bit)"
url="https://nice.freedesktop.org"
arch=(x86_64)
license=(LGPL)
depends=(lib32-gstreamer lib32-gupnp-igd libnice)
makedepends=(git gobject-introspection meson)
_commit=e25c3e5113c7b7002a78bcca2ecf058bbf7de6d4  # tags/0.1.15^0
source=("git+https://anongit.freedesktop.org/git/libnice/libnice#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/-/+/g'
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    arch-meson libnice build \
        --libdir='/usr/lib32' \
        -Dtests=disabled \
        -Dgtk_doc=disabled

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install

    rm -rf "${pkgdir}"/usr/{bin,include,share}
}
