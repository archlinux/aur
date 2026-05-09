# Maintainer: stealthspectre <aneesh@envs.net>
pkgname=multi-audio-sink
pkgver=1.1.0
pkgrel=1
pkgdesc="Human-friendly TUI for combining, routing, and managing PipeWire audio outputs on Linux"
arch=('x86_64')
url="https://github.com/sambuaneesh/multi-audio-sink"
license=('MIT')
depends=('libpulse' 'gcc-libs' 'glibc')
makedepends=('cargo')
provides=('mas')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3d00e85a226b3141114133f9475dae1c8a4ff47694f0e6b533b94f8a9fa4d83')

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
