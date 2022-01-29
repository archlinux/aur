# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cargo-checkmate
pkgver=0.1.9
pkgrel=1
pkgdesc="Perform a series of useful checks out of the box"
arch=('x86_64')
url="https://github.com/nathan-at-least/cargo-checkmate"
license=('MIT')
depends=('zlib' 'openssl')
makedepends=('rust')
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
  'LICENSE'
)
sha512sums=('9fb55617a2996f43c4732d26a4280563a3dada3491c750859f00783b04e8e2276c88b3c2faba0e9f5097bafcbca0ce5ffaf6078735ae1540076443b619db3518'
            '551e243ac26e36a9deced2299c09ced251097d783efa9b91bba4d0928151e3af1ed8b34bb01f9a5082312e29aa71889d1d0787db2e0b21ff17912ef40ac693e9')
b2sums=('189be11f26dbd33c5e7509498f1d201720a5abc0e3efb9485baaed601474b1a59a6e1d411b74bea85a5f0c0d14a7b59ce69d619523f4b36442540e94559f61bd'
        '41c0f3c653eba534c8c3988550fcd90bd5c23cf1747ef80f67f2affd14ba6f2f824d825a507eb792f77e906275bbdc2efac41096d73326ddc85857a63b30abfe')

prepare() {
  cd "$pkgname-$pkgver"

  # download dependencies
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
  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
