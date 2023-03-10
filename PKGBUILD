# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-public-api
pkgver=0.27.3
pkgrel=1
pkgdesc="List and diff the public API of Rust library crates"
arch=('x86_64')
url="https://github.com/Enselic/cargo-public-api"
license=('MIT')
depends=('gcc-libs' 'libgit2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a4186ee9d8d04be4fdabfe52f3ac7fab0667ca2a3950ad7e3e8a9e0a0a43d42974cacc661f93b9acee7046cbd597ef9de17dfaeecc50e835be0f83451fb85adf')
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
