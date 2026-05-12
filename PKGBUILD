# Maintainer: Fezzik the Giant <fezzikthegiant@pm.me>
pkgname=riptide
pkgver=0.1.4
pkgrel=1
pkgdesc="A terminal UI music player for Tidal, built with Rust"
arch=('x86_64')
url="https://github.com/fezzik-the-giant/riptide"
license=('GPL-3.0-only')
depends=('mpv' 'openssl')
makedepends=('rust' 'cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fezzik-the-giant/riptide/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('30e83c25bb8ef2870609992adc8a79122b48b00f517334fdc8202770f088a2c1')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
