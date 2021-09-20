# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=reason
pkgver=0.3.4
pkgrel=1
pkgdesc="A shell for research papers"
arch=('x86_64')
url="https://github.com/jaywonchung/reason"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  'https://raw.githubusercontent.com/jaywonchung/reason/1410304549f0b924707822ad7ea33e5b9980b406/Cargo.lock'
)
sha512sums=('89c7ce01cb85bb800779ab9fc1844764bc28a24527808df52610ce94920ce567b5de76572695d2f19bcca2a34cac9ab7fd5cbea4c444b22b27e49fb013950fc6'
            '78bab8b03f0e1afcf9c95236af859dccd0e18f664cbcacae2c4a404bcf3163fc2a34c04a247a9c6626cdcd995c65d611ece901482aa0708a43839e07af5a7ef7')
b2sums=('5312dfb3d52a9b852e63de8e2fb410b21a54e5dd32592bfe7e88941a909f71c097c7131cc689c4da895a2f5c9985a57ed13a8178ea6b03ad09ff2ffd21f7635f'
        '9dfcb46de3d8af80025fc7255a20efbb171be0dfbd51811d7a922f9c40e87433b7826c03ce5471e481652d22ffc4bd24fde832d87c0ef96cd49e3e3b530758e0')

prepare() {
  cd "$pkgname-$pkgver"

  cp -vf ../Cargo.lock .

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
