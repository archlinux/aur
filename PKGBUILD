# Maintainer: hyprarcher <hyprarcher@proton.me>
pkgname=hyprmarker
pkgver=0.4.0
pkgrel=6
pkgdesc='ZoomIt-like screen annotation tool for Wayland compositors with wlr-layer-shell support'
arch=('x86_64' 'aarch64')
url='https://github.com/devmobasa/hyprmarker'
license=('MIT')
depends=(
    'cairo'
    'wayland'
    'pango'
    'gcc-libs'
    'glibc'
    'wl-clipboard'
    'grim'
    'slurp'
)
makedepends=(
    'cargo'
    'git'
)
# Use GitHub as source
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
    if [[ -f configurator/Cargo.toml ]]; then
        cargo fetch --locked --manifest-path configurator/Cargo.toml --target "$CARCH-unknown-linux-gnu"
    fi
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
    cargo build --frozen --release --manifest-path configurator/Cargo.toml
}

package() {
    cd "$pkgname"

    # Install binaries
    install -Dm755 "target/release/hyprmarker" "$pkgdir/usr/bin/hyprmarker"
    install -Dm755 "target/release/hyprmarker-configurator" "$pkgdir/usr/bin/hyprmarker-configurator"

    # Install systemd user service
    install -Dm644 packaging/hyprmarker.service "$pkgdir/usr/lib/systemd/user/hyprmarker.service"

    # Install example config
    install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install license if available
    [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}
