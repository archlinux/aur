# Maintainer: Sich <little_sich@tuta.io>
# Contributor: George Rawlinson <grawlinson@archlinux.org> 
pkgname=rustzx
pkgver=0.16.0
pkgrel=1
pkgdesc='ZX Spectrum emulator written in Rust'
arch=('x86_64')
url='https://github.com/rustzx/rustzx'
license=('MIT')
depends=('gcc-libs' 'alsa-lib')
makedepends=('rust' 'cmake')
options=('!lto')
source=(https://github.com/rustzx/rustzx/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('a6ae54390ac81e5e8bd9cf5ce87ee9e27a6ea202f99b0b1ba6111ad1bbb8d5eef64f631154f177361cc51507f2eafd9f7b55be2241ccc9a4ba4019831d5ff21b')

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
  install -vDm755 -t "$pkgdir/usr/bin" target/release/{rustzx,vtx}

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
