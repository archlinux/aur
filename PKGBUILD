# Maintainer: Francisco V. <fvasquez dot public at fvtronics dot com>
pkgname=chillspot
pkgver=0.2.1
pkgrel=1
pkgdesc="Fan curve control and temperature monitor for MSI laptops"
arch=('x86_64')
url="https://codeberg.org/FVtronics/Chillspot"
license=('GPL-3.0-or-later')
depends=(
    'dbus'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk4'
    'libadwaita'
    'polkit'
    'systemd'
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
sha256sums=('f7a256ac4c5f85d3f6ec460527506c9125f6949e55e964901dc46a96dde12a84')

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
