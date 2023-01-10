# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=gssdp
pkgname=lib32-gssdp
pkgver=1.6.2
pkgrel=2
pkgdesc="A GObject-based API for handling resource discovery and announcement over SSDP (32-bit)"
arch=(x86_64)
url="http://gupnp.org/"
license=(LGPL)
depends=(lib32-libsoup3 gssdp)
makedepends=(git meson vala)
_commit=c2d417d6a79f03c095e5730efd60015eb3109a82 # tags/gssdp-1.6.2^0
source=("git+https://git.gnome.org/browse/gssdp#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/^gssdp-//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
    cd $_basename
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson $_basename build \
        --libdir='/usr/lib32' \
        -Dgtk_doc=false \
        -Dsniffer=false \
        -Dintrospection=false \
        -Dexamples=false \
        -Dmanpages=false

    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="$pkgdir" meson install -C build

    rm -rf "${pkgdir}/usr/include"
}
