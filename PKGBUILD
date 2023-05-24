# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-public-api
pkgver=0.30.0
pkgrel=1
pkgdesc="List and diff the public API of Rust library crates"
arch=('x86_64')
url="https://github.com/Enselic/cargo-public-api"
license=('MIT')
depends=('gcc-libs' 'libgit2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('eb888a87b00a554a3b1f942f2cecbb5b4e3ecb10d1afefa02cdde0c9263aae0a5879b0ae5a0ee9af506c8d4b2d61269737cabf937e13f1e763b110866b584975')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  mkdir completions
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
  local compgen="target/release/$pkgname completions"
  $compgen bash > "completions/$pkgname"
  $compgen fish > "completions/$pkgname.fish"
  $compgen zsh  > "completions/_$pkgname"
}

# tests require nightly
#check() {
#  cd "$pkgname-$pkgver"
#  cargo test --frozen
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "completions/$pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
