# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=bartib
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple timetracker for the command line"
arch=('x86_64')
url="https://github.com/nikolassv/bartib"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ba66195bf6bc382cf366de95aadb3b6c49c5d27bf772cd2cdbe082740df181c6efdd12d04a05cde6afe5c3b732226ba806981d27d275924e1b2c2545fd67cd3b')
b2sums=('74389818de8c16c91bdbc76070a32918170497520e1ad43eb20353cf04c65f2605b23bd101dd4a6c1f7f14d443332fedebc1e75f03fb0b9f3b795070b20ff3e8')

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
