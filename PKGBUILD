# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=gssdp
pkgname=lib32-gssdp
pkgver=1.2.1
pkgrel=1
pkgdesc="A GObject-based API for handling resource discovery and announcement over SSDP (32-bit)"
arch=(x86_64)
url="http://gupnp.org/"
license=(LGPL)
depends=(lib32-libsoup gssdp)
makedepends=(git gobject-introspection lib32-gtk3 meson vala)
_commit=454c1d5a8f5e16c49e360696b063732e25ec780b  # tags/gssdp-1.2.1^0
source=("git+https://git.gnome.org/browse/gssdp#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/^gssdp-//;s/-/+/g'
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/pkg-config-32'

    arch-meson $_basename build \
        --libdir='/usr/lib32' \
        -Dgtk_doc=false

    ninja -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="$pkgdir" meson install -C build

    rm -rf "${pkgdir}"/usr/{bin,include,share}
}
