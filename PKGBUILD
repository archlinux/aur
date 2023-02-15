# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-cabal
pkgver=0.8.1
pkgrel=1
pkgdesc='Turn in one command a Rust crate into a Haskell Cabal library'
url='https://github.com/yvan-sraka/cargo-cabal'
license=('Apache' 'MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yvan-sraka/cargo-cabal/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('32299953cc4d6c1131fe3cad6f5374673bf92ed83f42e52188f298954eced45b')
b2sums=('01ed53f26fbda1fce9801698d1353e7c592b5836aef0f12852dcea787873ad7b6cfb10e292d185f8faf125c602e75085c70dc0a7b6768e8a12dd34468b6a7b1c')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target $_target
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/cargo-cabal

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-{APACHE,MIT}
}
