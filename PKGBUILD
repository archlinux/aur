# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-cabal
pkgver=0.9.0
pkgrel=1
pkgdesc='Turn in one command a Rust crate into a Haskell Cabal library'
url='https://github.com/yvan-sraka/cargo-cabal'
license=('Apache' 'MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yvan-sraka/cargo-cabal/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('354a1736024d7cd969fec94d1662556b4b80a05d179cdb069b816d3b4c9001cd')
b2sums=('57d8ee814f46ef57aeca3366ac0d8cd6a06a4bf393c1efeed4f64ec3047864b9d6ac3b43ce6f1081cc74a5ee8372a636ce7a58cc65dd2fced1ac1de38b95fb38')

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
