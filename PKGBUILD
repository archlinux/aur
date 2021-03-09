# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=sic-image-cli
_pkgname=sic
pkgver=0.18.0
pkgrel=1
pkgdesc="Accessible image processing and conversion from the terminal"
arch=('x86_64')
url="https://github.com/foresterre/sic"
license=('MIT')
conflicts=("$_pkgname")
depends=('gcc-libs')
makedepends=('rust' 'nasm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5aa90b836b9547ab72667121716ae30d37f003e129dd8f5f9664d093966c6c779cf7a4bd372a896b53e8182c5f40f1f98bbe7f5353eceb6ddbcbde07d071bf8d')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked --all-features
  cargo run --example gen_completions
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "$_pkgname.bash" "${pkgdir}/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "$_pkgname.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "_$_pkgname" -t "${pkgdir}/usr/share/zsh/site-functions"
}
