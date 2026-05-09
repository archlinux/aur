# Maintainer: stealthspectre <aneesh@envs.net>
pkgname=multi-audio-sink
pkgver=1.1
pkgrel=1
pkgdesc="Human-friendly TUI for combining, routing, and managing PipeWire audio outputs on Linux"
arch=('x86_64')
url="https://github.com/sambuaneesh/multi-audio-sink"
license=('MIT')
depends=('libpulse' 'gcc-libs' 'glibc')
makedepends=('cargo')
provides=('mas')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1f9c4b5468412992b2e9f73f3ce9b71445665588507e9ddb4cfa980e66b7df36')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
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
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/mas" "$pkgdir/usr/bin/mas"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
