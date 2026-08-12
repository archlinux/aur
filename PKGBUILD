# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=cookcli
_pkgname=cook
pkgver=0.32.1
pkgrel=1
pkgdesc="Suite of tools to create shopping lists and maintain recipes"
arch=('x86_64')
url="https://github.com/cooklang/cookcli"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('70c1d69148d8a96d1df1020775c0ed52af62601b3497f52e39b15521fa7debeee414f00eae667678454c111f1f2d61c652ad4ee3493d73a3aa7d2abeaaa72fd0')
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
