# Maintainer: Alexander Beck <dev@daallexx.eu>

pkgname=monocle
pkgver=0.5.2
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
  'c933b991a8fc8e22c192ce9885ca8e362ed5a2e10c924f778f19759ddf6b9019264266efe7050013584e6355058b6175f24a28a5050b787738b0760cfa516472'
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

