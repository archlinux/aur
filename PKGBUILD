# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-cabal
pkgver=0.8.0
pkgrel=1
pkgdesc='Turn in one command a Rust crate into a Haskell Cabal library'
url='https://github.com/yvan-sraka/cargo-cabal'
license=('Apache' 'MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yvan-sraka/cargo-cabal/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c003a595c80353952c8bb62a5820a339dcf27261298db8e47d9f254ff7359ed5')
b2sums=('3de92b911edaf5ddc960572243b4e3df8a816b8528fa31612febab034e280dd76e1fe2ad4323316e637a9567173d2d2fd9db19bc3b5e94fb4b020cfbd87a7d07')

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
