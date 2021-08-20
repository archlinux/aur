# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=bytehound
pkgver=0.7.0
pkgrel=1
pkgdesc="A memory profiler for Linux"
arch=('x86_64')
url="https://github.com/koute/bytehound"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rustup' 'yarn' 'node-gyp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('3f29bc27c082eab503a2c36566a4da56dde9bbcd61df365f8632e7d5b3d9151f419a2f80bea74df4c409910e2f725a85a6fa56c39b43810ffe7510bebc3d6372')

prepare() {
  cd "$pkgname-$pkgver"

  # setup toolchain with a pinned nightly version
  echo "nightly-2021-08-19" > rust-toolchain

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build \
    --frozen \
    --release \
    --all-features \
    --package bytehound-preload \
    --package bytehound-cli
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # shared lib
  install -vDm755 -t "$pkgdir/usr/lib" "target/release/lib$pkgname.so"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

# vim:set ts=2 sw=2 et:
