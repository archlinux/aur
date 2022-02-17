# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kbs2
pkgver=0.4.0
pkgrel=1
pkgdesc="A secret manager backed by age"
arch=('x86_64')
url="https://github.com/woodruffw/kbs2"
license=('MIT')
depends=('libx11' 'gcc-libs')
makedepends=('cargo' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ec6bbef7abed8343a46e3c4e19760ace9c8cac9eeaed28af692aa466fae4a6d185454e8a1f0bfffd861c37b3340b1aaf0303c68eae7b484ebe74e059f57a915e')

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
