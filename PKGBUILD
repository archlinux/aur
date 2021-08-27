# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=reason
pkgver=0.3.2
pkgrel=1
pkgdesc="A shell for research papers"
arch=('x86_64')
url="https://github.com/jaywonchung/reason"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('4c4f66afabf6ef7ca5f61988f620a413590a2778e4a201b05f5acea02d2aff5e8c3d578b18ed4a064872f76cf5bf7c83744b7917c0dcd8135d432f1fadaf3d43')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/reason

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr examples man "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
