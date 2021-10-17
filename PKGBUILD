# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-checkmate
pkgver=0.1.8
pkgrel=1
pkgdesc="Perform a series of useful checks out of the box"
arch=('x86_64')
url="https://github.com/nathan-at-least/cargo-checkmate"
license=('MIT')
depends=('zlib' 'openssl')
makedepends=('rust')
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
  'LICENSE'
)
sha512sums=('f09d4f3af3fcd37244bafdcbfe9b9e8f2210f9a8ed8a896accd3d5db527aa3da3b6467897f3cd54de5fc4ba52a1e3c5fc2e392401bafca34f66a21c6af15ceee'
            '551e243ac26e36a9deced2299c09ced251097d783efa9b91bba4d0928151e3af1ed8b34bb01f9a5082312e29aa71889d1d0787db2e0b21ff17912ef40ac693e9')
b2sums=('c3d1f939175e238105b5055df94f1973b33f39b3cbf74b8860826b1a325dd86b863db3a42749e12154c80cb8e72e04681fc8385e19cfcac79630932c97c1a9cd'
        '41c0f3c653eba534c8c3988550fcd90bd5c23cf1747ef80f67f2affd14ba6f2f824d825a507eb792f77e906275bbdc2efac41096d73326ddc85857a63b30abfe')

prepare() {
  # download dependencies
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
