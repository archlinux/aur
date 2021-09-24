# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=cotp
pkgver=0.1.8
pkgrel=1
pkgdesc='Trustworthy encrypted command line authenticator app compatible with multiple backups.'
arch=('x86_64')
url='https://github.com/replydev/cotp'
license=('GPL3')
makedepends=('cargo' 'python')
depends=('libxcb' 'libxkbcommon-x11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d2c66a18db2edd5930c8d0a34ae0fd64fe2888fa3cec134ca59fc590ff650442')

prepare(){
  cd "$pkgname-$pkgver"
  cargo update
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check(){
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
