# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=gssdp
pkgname=lib32-gssdp
pkgver=1.6.3
pkgrel=1
pkgdesc="A GObject-based API for handling resource discovery and announcement over SSDP (32-bit)"
arch=(x86_64)
url="http://gupnp.org/"
license=(LGPL)
depends=(lib32-libsoup3
         gssdp)
makedepends=(git
             meson
             vala)
_commit=28c388aa45698dcc09ba24e8de849653e9eedf8c  # tags/gssdp-1.6.3^0
source=("git+https://git.gnome.org/browse/gssdp#commit=$_commit")
b2sums=('SKIP')

pkgver() {
    cd gssdp

    git describe --tags | sed 's/^gssdp-//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
    cd gssdp
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    local meson_options=(
        --libdir='/usr/lib32' \
        -Dgtk_doc=false \
        -Dsniffer=false \
        -Dintrospection=false \
        -Dexamples=false \
        -Dmanpages=false
    )

    arch-meson gssdp build "${meson_options[@]}"

    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="$pkgdir" meson install -C build

    rm -rf "${pkgdir}/usr/include"
}
