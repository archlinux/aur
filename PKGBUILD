# Maintainer: Austin Riba <austin@m51.io>
pkgname=furtherance-gtk
pkgver=1.9.2
pkgrel=1
pkgdesc="Track your time without being tracked (GTK fork)"
arch=("x86_64" "aarch64")
url="https://github.com/Fingel/furtherance-gtk"
license=("GPL-3.0-or-later")
depends=("dbus" "glib2" "gtk4" "libadwaita" "sqlite")
makedepends=("cargo" "gettext" "meson" "ninja")
conflicts=("furtherance" "furtherance-git")
options=(!lto !debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fingel/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("13bd86ddc92eda0365f7f96b211ab4a0c390fb4c1133e462bc652f48009914bb11d3126d04ecfa7768d9e26af1aef7a20823fdcc6be18f4b03d4e6d5fad0be5c")

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/build/cargo-home"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_NET_OFFLINE=true
    export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }--remap-path-prefix=$srcdir=."
    arch-meson "$pkgname-$pkgver" build --buildtype=release
    meson compile -C build
}

package() {
    meson install -C "$srcdir/build" --destdir "$pkgdir" --no-rebuild
}
