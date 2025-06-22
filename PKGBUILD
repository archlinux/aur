# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=imagineer
pkgver=0.24.0
pkgrel=1
pkgdesc="Accessible image processing and conversion from the terminal"
arch=('x86_64')
url="https://github.com/foresterre/sic"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'nasm')
replaces=('sic-image-cli')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('26f9ee651a6c514a4fc47473a831e6c73e3266e95e060ce9498b72817d9ad5dcb4bdfb9267a5de0ac52f526a421a7161c9eaa7e62526dfc65b93ffee9c964492')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen --all-features
  cargo run --example gen_completions
}

# check() {
#   cd "$pkgname-$pkgver"
#   cargo test --frozen
# }

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/ig" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "ig.bash" "${pkgdir}/usr/share/bash-completion/completions/$pkgname"
  install -Dm 644 "ig.fish" "${pkgdir}/usr/share/fish/completions/$pkgname.fish"
  install -Dm 644 "_ig" "${pkgdir}/usr/share/zsh/site-functions/_$pkgname"
}
