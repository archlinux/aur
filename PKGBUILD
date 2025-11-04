# Maintainer: hyprarcher <hyprarcher@proton.me>
pkgname=wayscriber
pkgver=0.6.3
pkgrel=1
pkgdesc='Screen annotation tool for Wayland compositors (formerly hyprmarker)'
arch=('x86_64' 'aarch64')
url='https://wayscriber.com'
license=('MIT')
install=wayscriber.install
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
conflicts=('hyprmarker<0.6.3' 'hyprmarker-debug<0.6.3' 'wayscriber-debug<0.6.3')
replaces=('hyprmarker' 'hyprmarker-debug' 'wayscriber-debug')
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
    cargo build --frozen --release --bins --manifest-path configurator/Cargo.toml
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/wayscriber" "$pkgdir/usr/bin/wayscriber"
    install -Dm755 "target/release/wayscriber-configurator" "$pkgdir/usr/bin/wayscriber-configurator"

    install -Dm644 packaging/wayscriber.service "$pkgdir/usr/lib/systemd/user/wayscriber.service"
    install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}
