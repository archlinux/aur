# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=get-blessed
_pkgname=get_blessed_rs
pkgver=0.1.3
pkgrel=1
pkgdesc="Get the best crates for your Rust projects with a few keybindings"
arch=('x86_64')
url="https://github.com/josueBarretogit/get_blessed_rs"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('18eb631762476f8065e8dab64bc46b0e7239db395ff35750994208ecec524a58dbfef37a4948e736330142f8c3a2a095ceb1132688977e76373a778a1625662f')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" # --locked
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --frozen -- --skip "general_table_has_expected_data"
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
