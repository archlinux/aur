# Maintainer: Coobyk <mail@coobyk.com>
pkgname=tdrive
pkgver=0.1.4
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
sha256sums=('f26de5a7cc8262a095a989263687630feb65f63c766ed70178c5e80cb0acd9f9')

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
