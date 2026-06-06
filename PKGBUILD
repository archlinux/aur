# Maintainer: Francisco V. <fvasquez dot public at fvtronics dot com>
pkgname=quire
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple GNOME utility for working with local PDF files"
arch=('x86_64')
url="https://codeberg.org/FVtronics/Quire"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'glib2'
    'gtk4'
    'libadwaita'
    'poppler-glib'
)
makedepends=(
    'appstream'
    'blueprint-compiler'
    'cargo'
    'desktop-file-utils'
    'gettext'
    'meson'
    'ninja'
    'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('768a1a63fcea02fbf14ac3b53400f10013143fe7f82466f758927430cfe53203')

prepare() {
    cd "$pkgname"

    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    meson setup "$pkgname" build \
        --prefix=/usr \
        --buildtype=release \
        -Dcargo-home="$srcdir/cargo-home"

    CARGO_NET_OFFLINE=true meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
