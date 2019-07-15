# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=gupnp
pkgname=lib32-gupnp
pkgver=1.2.1
pkgrel=1
pkgdesc="An object-oriented UPNP framework (32-bit)"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/GUPnP"
license=(LGPL)
depends=(lib32-gssdp gupnp)
makedepends=(git gobject-introspection meson vala)
_commit=b9f76cada1038be75963593ad783d88d9446fce6  # tags/gupnp-1.2.1^0
source=("git+https://gitlab.gnome.org/GNOME/gupnp.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/^gupnp-//;s/-/+/g'
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
