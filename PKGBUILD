# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=cookcli
_pkgname=cook
pkgver=0.19.3
pkgrel=1
pkgdesc="Suite of tools to create shopping lists and maintain recipes"
arch=('x86_64')
url="https://github.com/cooklang/cookcli"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('707064d3c5c63294d9660dfb9d2e239838c740037971b08517595c92b351a6029e6eb9ce4a85eae0b5b4204f8bb433909ef9fb434f604c8ecac9065df3d86afc')
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
