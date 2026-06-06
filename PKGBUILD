# Maintainer: Francisco V. <fvasquez dot public at fvtronics dot com>
pkgname=quire
pkgver=0.2.6
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
sha256sums=('c7d9338b6280ad9079c2d9e1ac3ccd294ce573d9ac406a0fc033cf1f79b7bcce')

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
