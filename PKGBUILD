# Maintainer: Alexander Beck <dev@daallexx.eu>

pkgname=monocle
pkgver=0.5.3
pkgrel=1
pkgdesc='See through all BGP data with a monocle'
arch=('x86_64')
url='https://github.com/bgpkit/monocle'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha512sums=(
  'b3b9ab1c6ee0d878f90cacfbf90e2e6897f4f0d1c23e3161bfd155a63373fe4d9dfcee6696fb071b21b22d51ea274da3c63e9ffd3d8c3fab266f957d65020e29'
)

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo update
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
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

