# Maintainer: Austin Riba <austin@m51.io>
pkgname=furtherance-gtk
pkgver=1.9.1
pkgrel=2
pkgdesc="Track your time without being tracked (GTK fork)"
arch=("x86_64" "aarch64")
url="https://github.com/Fingel/furtherance-gtk"
license=("GPL-3.0-or-later")
depends=("dbus" "glib2" "gtk4" "libadwaita" "sqlite")
makedepends=("cargo" "gettext" "meson" "ninja")
conflicts=("furtherance" "furtherance-git")
options=(!lto !debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fingel/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("1d787f803825e72e3f99252d9d58dfef4a1e65843598a594437e43de9f57c0134751b8da5f32cac802028763e543151936b5fa2a6bdbe0d0921adf016c24bf56")

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
