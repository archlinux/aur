# Maintainer: Francisco V. <fvasquez dot public at fvtronics dot com>
pkgname=folios
pkgver=0.1.6
pkgrel=1
pkgdesc="Simple GNOME utility for working with local PDF files"
arch=('x86_64')
url="https://gitlab.com/fvtronics/folios"
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
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('12c7fcb2cc2fde59d3e788361e10e37fa94e6f532ac1b8d06b7f30547356f7c4')

prepare() {
    cd "$pkgname-v$pkgver"

    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    meson setup "$pkgname-v$pkgver" build \
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
