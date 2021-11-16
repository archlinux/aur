# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=bartib
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple timetracker for the command line"
arch=('x86_64')
url="https://github.com/nikolassv/bartib"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('39dbac35dbf30152eecc789ecc6cc0f378e9db8ebe64df256928d8f668de66906bb61159b029fe57ab628beaa44c2e8d83ec70a7d8c6e81dd3e0ba0a44f5f15c')
b2sums=('b9309830cfa5d639f589ae75f4c152420ff9203f99e6ebd1704ca7ccd60e1f7c267670558fc5c8f2e3b204041c98ff941d049e16db1cc5a7a756369a6dba0675')

prepare() {
  cd "$pkgname-$pkgver"

  # download dependencies
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
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # shell auto-completions
  install -vDm644 misc/bartibCompletion.sh "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
