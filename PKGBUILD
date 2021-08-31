# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=reason
pkgver=0.3.3
pkgrel=1
pkgdesc="A shell for research papers"
arch=('x86_64')
url="https://github.com/jaywonchung/reason"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('4548cb96618310661271a4132754817e4be15ae5073a3ba8e30b8e9bc52b1ca5e98dd519c49a3e80ebf805d779dd421cea6f5133ee5a40ee42a53e377952c3e9')

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
