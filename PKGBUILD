# Maintainer: wayscriber maintainers <devmobasa+aur@proton.me>
pkgname=wayscriber
pkgver=0.5.1
pkgrel=2
pkgdesc='Screen annotation tool for Wayland compositors (formerly hyprmarker)'
arch=('x86_64' 'aarch64')
url='https://wayscriber.com'
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
provides=('hyprmarker')
conflicts=('hyprmarker<0.5.1' 'hyprmarker-debug<0.5.1')
replaces=('hyprmarker' 'hyprmarker-debug')
source=("git+https://github.com/devmobasa/wayscriber.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
    cargo fetch --locked --manifest-path configurator/Cargo.toml --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bins
    # Build configurator using same target directory
    cd configurator
    export CARGO_TARGET_DIR=../target
    cargo build --frozen --release --bins
    cd ..
}

package() {
    cd "$pkgname"

    # Install binaries (new names + compatibility aliases)
    install -Dm755 "target/release/wayscriber" "$pkgdir/usr/bin/wayscriber"
    install -Dm755 "target/release/hyprmarker" "$pkgdir/usr/bin/hyprmarker"
    install -Dm755 "target/release/wayscriber-configurator" "$pkgdir/usr/bin/wayscriber-configurator"

    # Create symlink for configurator compatibility
    ln -s wayscriber-configurator "$pkgdir/usr/bin/hyprmarker-configurator"

    # Install systemd user service
    install -Dm644 packaging/wayscriber.service "$pkgdir/usr/lib/systemd/user/wayscriber.service"

    # Install documentation and example config
    install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install license if available
    [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}
