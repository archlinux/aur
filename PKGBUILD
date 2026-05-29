# Maintainer: Jerrick <jerrick@example.com>
pkgname=danger-monitor
pkgver=1.0.0
pkgrel=1
pkgdesc="A high-performance system and GPU monitor (danmon) with high-res charts and themes"
arch=('x86_64')
url="https://github.com/J3rr1ck/danger-monitor"
license=('MIT')
depends=('gcc-libs' 'nvidia-utils')
makedepends=('rust' 'cargo')
source=("danger-monitor-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ec6c21bc25b56187ed572d83f0db54e558e8699cdb04d1d4b9900b29e0357f7')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/danger-monitor" "$pkgdir/usr/bin/danmon"
}
