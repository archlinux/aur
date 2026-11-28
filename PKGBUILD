# Maintainer: Coobyk <mail@coobyk.com>
pkgname=tdrive
pkgver=0.3.11
pkgrel=2
pkgdesc="TDrive-compatible Telegram-backed cloud drive client — Rust + GPUI desktop app"
arch=('x86_64' 'aarch64')
url="https://github.com/Coobyk/tdrive"
license=('MIT')
depends=('fuse3' 'openssl' 'fontconfig' 'libxcb' 'libxkbcommon' 'wayland')
makedepends=('cargo')
provides=('tdrive')
conflicts=('tdrive')
source=("tdrive-$pkgver.tar.gz::https://github.com/Coobyk/tdrive/archive/v$pkgver.tar.gz")
sha256sums=('59516d989d7718d5d332c86ac1898a0c546fbe1755b08a23024d0e28fad7bfce')

prepare() {
    cd "tdrive-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "tdrive-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "tdrive-$pkgver"
    install -Dm755 "target/release/tdrive" "$pkgdir/usr/bin/tdrive"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 packaging/tdrive.desktop "$pkgdir/usr/share/applications/tdrive.desktop"
    install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tdrive.svg"
    for s in 256 128 64 48 32; do
        install -Dm644 "packaging/hicolor/tdrive-$s.png" \
            "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/tdrive.png"
    done
}
