# Maintainer: Coobyk <mail@coobyk.com>
pkgname=tdrive
pkgver=0.1.0
pkgrel=1
pkgdesc="TDrive-compatible Telegram-backed cloud drive client — Rust + GPUI desktop app"
arch=('x86_64' 'aarch64')
url="https://github.com/Coobyk/tdrive-rs"
license=('MIT')
depends=('fuse3' 'openssl' 'fontconfig' 'libxcb' 'libxkbcommon' 'wayland')
makedepends=('cargo')
provides=('tdrive')
conflicts=('tdrive')
source=("tdrive-rs-$pkgver.tar.gz::https://github.com/Coobyk/tdrive-rs/archive/v$pkgver.tar.gz")
sha256sums=('c8adc3095e5e14d2c533f7e486d87a3d59ec1517049b4d4b83c65822313a3918')

prepare() {
    cd "tdrive-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "tdrive-rs-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "tdrive-rs-$pkgver"
    install -Dm755 "target/release/tdrive-rs" "$pkgdir/usr/bin/tdrive"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
