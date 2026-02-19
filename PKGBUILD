# Maintainer: Arian Pieroni <ari4n.pieroni@gmail.com>
pkgname='clock'
pkgver=1.0.0
pkgrel=1
pkgdesc='A simple cli tool, providing a timer and a stopwatch.'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://github.com/R4ZXRN3T/clock'
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'rustup' 'upx' 'base-devel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/R4ZXRN3T/clock/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  rustup component add rust-src --toolchain nightly
}

build() {
  cd "$pkgname-$pkgver"
  RUSTFLAGS="-Zlocation-detail=none -Zfmt-debug=none" cargo +nightly build \
    -Z build-std=std,panic_abort \
    -Z build-std-features="optimize_for_size" \
    --release
  upx --ultra-brute target/release/clock
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/clock "$pkgdir/usr/bin/clock"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
