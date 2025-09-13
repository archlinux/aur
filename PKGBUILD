# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=bartib
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple timetracker for the command line"
arch=('x86_64')
url="https://github.com/nikolassv/bartib"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5df3872aeb9795a6180bc0d2bed949f9b01f37b99e8b81ba02e5ca72897fd50cf241341037c9f37acdb079918ff9b5c6e18934801a2618cdaa16fafd856b50c8')
b2sums=('8602f2fdbe2740eceb4742a21af980c82748150813966927e4016050285e411f86442106bbe150aa8071dccb8a2ed1b0f9bb4e527329aca9ed65e04430c5a7ab')

prepare() {
  cd "$pkgname-$pkgver"

  # download dependencies
  cargo fetch --target "$CARCH-unknown-linux-gnu"
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
