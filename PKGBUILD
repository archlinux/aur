# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=cookcli
_pkgname=cook
pkgver=0.29.1
pkgrel=1
pkgdesc="Suite of tools to create shopping lists and maintain recipes"
arch=('x86_64')
url="https://github.com/cooklang/cookcli"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('98ed4a637e7dfa05d3e152fc8f5489af210f8c9cebd4fb3770cd99cf11cdeedf68c1a6ff7509dfc0e2b6660d8e205e4985f4eaa2bfad04a6fc39e99e2febf793')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen --no-default-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --no-default-features -- --skip "test_help_output"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
