# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=cookcli
_pkgname=cook
pkgver=0.34.0
pkgrel=1
pkgdesc="Suite of tools to create shopping lists and maintain recipes"
arch=('x86_64')
url="https://github.com/cooklang/cookcli"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver-source.tar.gz::$url/releases/download/v$pkgver/cook-$pkgver-source.tar.gz")
sha512sums=('36c59233047082d9402f8e9e1a20567a42c7ce670e5d2472352f7558fcbab355c4e0bbbe350f987cd0b10dfc3308aa552039bfc53b5d18ef64ed9b8dd0a9dca8')
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
  cargo test --frozen --no-default-features --lib -- \
    --skip "test_help_output" --skip "copy_static_assets_writes_known_file"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
