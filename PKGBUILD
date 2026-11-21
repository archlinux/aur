# Maintainer: Coobyk <mail@coobyk.com>
pkgname=tdrive
pkgver=0.1.0
pkgrel=2
pkgdesc="TDrive-compatible Telegram-backed cloud drive client — Rust + GPUI desktop app"
arch=('x86_64' 'aarch64')
url="https://github.com/Coobyk/tdrive-rs"
license=('MIT')
depends=('fuse3' 'openssl' 'fontconfig' 'libxcb' 'libxkbcommon' 'wayland')
makedepends=('cargo')
provides=('tdrive')
conflicts=('tdrive')
source=("tdrive-rs-$pkgver.tar.gz::https://github.com/Coobyk/tdrive-rs/archive/v$pkgver.tar.gz")
sha256sums=('d0980001b1b0005f1740aee88de25469caa0856bd8f76688018d5e79eb53b36a')

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
    install -Dm644 packaging/tdrive.desktop "$pkgdir/usr/share/applications/tdrive.desktop"
    install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tdrive.svg"
    for s in 256 128 64 48 32; do
        install -Dm644 "packaging/hicolor/tdrive-$s.png" \
            "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/tdrive.png"
    done
}
