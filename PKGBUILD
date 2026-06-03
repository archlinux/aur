# Maintainer: Francisco V. <fvasquez dot public at fvtronics dot com>
pkgname=folios
pkgver=0.2.2
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
sha256sums=('50adbf5ebec4e22033239bb5e1ae057a589fd1da3035a2228c6367e0867264ac')

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
