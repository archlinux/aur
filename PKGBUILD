# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=libnice
pkgname=lib32-libnice
pkgver=0.1.22
pkgrel=1
pkgdesc="An implementation of the IETF's draft ICE (for p2p UDP data streams) (32-bit)"
url="https://nice.freedesktop.org"
arch=(x86_64)
license=('MPL-1.1 OR LGPL-2.1-only')
depends=(lib32-glib2
        lib32-gupnp-igd
        lib32-gnutls
        libnice)
makedepends=(git
             lib32-gstreamer
             meson)
optdepends=('lib32-gstreamer: "nice" GStreamer plugin')
_commit=ae3eb16fd7d1237353bf64e899c612b8a63bca8a  # tags/0.1.22^0
source=("git+https://gitlab.freedesktop.org/libnice/libnice.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
    cd libnice

    git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
    cd libnice

    # GUPnP-IGD 1.6
    sed -i 's/gupnp-igd-1\.0/gupnp-igd-1.6/' meson.build
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson libnice build \
        --libdir='/usr/lib32' \
        -Dexamples=disabled \
        -Dgtk_doc=disabled \
        -Dintrospection=disabled


    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="${pkgdir}" meson install -C build

    rm -rf "${pkgdir}"/usr/{bin,include}
}
