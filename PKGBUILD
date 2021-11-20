# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=elfshaker
pkgver=0.9.0
pkgrel=1
pkgdesc="A low-footprint, high-performance version control system fine-tuned for binaries"
arch=('x86_64')
url="https://github.com/elfshaker/elfshaker"
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ccf1a8a2c40fa7a1972a2786ab3d72adc838d14bc385f265a0559b3c649124db06d8bdcaea57f039890b57b8d184510580bac8e294da2cc16e8731e2a8d67b93')
b2sums=('33fa3c31d06dd663d5f8703d708f073aead97ed590bcea2e75748caa0c105e581a7f8ae43decd99dbb718f52e80e86ae332e5d11d59d72aaac9c3ad658dee944')

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
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md SECURITY.md
  cp -vr docs/* "$pkgdir/usr/share/doc/$pkgname"
}
