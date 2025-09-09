# Maintainer: Tobias Gerold <tobias at g3ro dot eu>

pkgname=xremap-kde
_pkgname=xremap
pkgver=0.10.17
_pkgver=0.10.17
pkgrel=1
pkgdesc="Key remapper for X11 and Wayland - KDE Edition"
arch=('x86_64' 'aarch64')
url="https://github.com/xremap/xremap"
license=('MIT')
makedepends=(cargo)
provides=('xremap')

source=("$_pkgname-$_pkgver.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$_pkgver.crate"
        )
sha256sums=('37b1a1e73a3333a37eda61f5bb1e0bee6a2a4979b2d4d6325b08b5e01b501b1e')

prepare() {
    cd "$srcdir/$_pkgname-$_pkgver/"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_pkgname-$_pkgver/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --features kde
    # alternatives for --features:
    # x11
    # gnome # GNOME Wayland
    # wlroots # Sway, Hyprland, etc.
}

check() {
    cd "$srcdir/$_pkgname-$_pkgver/"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --features kde
    # alternatives for --features see above
}

package() {
    cd "$srcdir/$_pkgname-$_pkgver/"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}

