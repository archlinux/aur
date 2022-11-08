# Maintainer: Matt Robinson <aur@nerdoftheherd.com>

pkgname=signal-backup-decode
pkgver=0.2.3
pkgrel=2
pkgdesc="Decode Signal Backups"
arch=('i686' 'x86_64')
url="https://github.com/pajowu/signal-backup-decode"
license=('GPL3')
depends=('openssl' 'sqlite')
makedepends=('git' 'rust' 'protobuf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8ef0591e87f0fa717795198644f431840f7c479327e2efb67d30493b2b78091895f7cf9426e3b68e9292a2d5ca17a49762b742955748038f589d7979c4889ae3')

build() {
  cd "$pkgname-$pkgver"
  cargo update -p protoc-rust --precise 2.22.1
  cargo update -p openssl --precise 0.10.42
  cargo build --features "rebuild-protobuf" --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
