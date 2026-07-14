# Maintainer: Francisco V. <fvasquez dot public at fvtronics dot com>
pkgname=shears
pkgver=0.4.4
pkgrel=1
pkgdesc="Simple GNOME utility for working with local PDF files"
arch=('x86_64')
url="https://codeberg.org/FVtronics/Shears"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'gcc-libs'
    'glibc'
    'glib2'
    'gtk4'
    'libadwaita'
    'poppler-glib'
)
makedepends=(
    'appstream'
    'cargo'
    'desktop-file-utils'
    'gettext'
    'meson'
    'ninja'
    'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('95f4a9774ecbd535a3ead7f0a603499eba45382ae3806bf8de561987eaeb9ab2')

prepare() {
    cd "$pkgname"

    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    arch-meson "$pkgname" build \
        -Dcargo-home="$srcdir/cargo-home"

    CARGO_NET_OFFLINE=true meson compile -C build
}

check() {
    export CARGO_HOME="$srcdir/cargo-home"
    cargo test --frozen --manifest-path "$pkgname/Cargo.toml"

    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
