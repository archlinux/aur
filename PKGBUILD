# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=cookcli
_pkgname=cook
pkgver=0.18.2
pkgrel=1
pkgdesc="Suite of tools to create shopping lists and maintain recipes"
arch=('x86_64')
url="https://github.com/cooklang/cookcli"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8906d50fd32b2759438f107fac455a635b5bf3d71b5f58696a20e72fffb2840fafe6cf8c2db50c75fb57a49bc1facbd26431f91bf49a78f1682cbacdf6b60e01')
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
