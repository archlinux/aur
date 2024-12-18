# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=ad
pkgver=0.2.0
pkgrel=1
pkgdesc='An adaptable text editor'
arch=('x86_64')
url="https://github.com/sminez/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7bb4aba27b34e0eb0814bfa14c3b6d87a0c411e8ae12de2c62f76f23ab358a70')
makedepends=('cargo')
depends=('gcc-libs')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "doc/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -R doc/* "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
