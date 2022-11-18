# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=reason
pkgver=0.3.6
pkgrel=1
pkgdesc='A shell for research papers'
arch=('x86_64')
url='https://github.com/jaywonchung/reason'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  'Cargo.lock'
)
sha512sums=('341eefe8394902ba9f0540fa577fd3cf1ecd142f9b0c74e77fa9e952ab7b8a0b0f9aefb01410af64b4c419471d21e098e50e4d7f4646eee2c2be3664aebc37ac'
            '3c15f4dd8fed641fb94d40cded1fab9164243873c9645f61d5a51b8cbdf41ae318899910f2e19e8885457dcff837b21f6b520e9416e065265729c4270d77305c')
b2sums=('be0a2381b962e86ff1c353bc598a62e4f62cff29e1029ac2cdab46fb1e505d8c882ed3bb9417e35d37c6d9cc30e8a7ac0d3678bb4f17ed0f04ccb144027a1616'
        'c64164a9fab29a0285af35115843d497034c08b751294e837e36b8fdb6022d216456079090c8f81bbb5310e1547aa203723f8d88b4243f8ea31149d6190fd101')

prepare() {
  cd "$pkgname-$pkgver"

  # updated lockfile
  cp -vf "$srcdir/Cargo.lock" Cargo.lock

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
  install -vDm755 -t "$pkgdir/usr/bin" target/release/reason

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr examples man "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
