# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kbs2
pkgver=0.7.2
pkgrel=1
pkgdesc="A secret manager backed by age"
arch=('x86_64')
url="https://github.com/woodruffw/kbs2"
license=('MIT')
depends=('libx11' 'gcc-libs')
makedepends=('cargo' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9d74dfaa17702a44e20332618aa094e52899a1f27a6af35a65ef928f62d5dc0bebe1a8ed20618a89b8ae468d47cb6ef4608d538ec4d5b317f6f5d9338cf8b2b7')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  "target/release/$pkgname" --completions bash | install -Dm 644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/$pkgname"
  "target/release/$pkgname" --completions fish | install -Dm 644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/$pkgname.fish"
  "target/release/$pkgname" --completions zsh | install -Dm 644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_$pkgname"
}
