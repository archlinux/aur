# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kbs2
pkgver=0.2.2
pkgrel=1
pkgdesc="A secret manager backed by age"
arch=('x86_64')
url="https://github.com/woodruffw/kbs2"
license=('MIT')
depends=('libx11')
makedepends=('rust' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('1e86660c9a75aa78230d2ff331e6de7d938c8d90866a786fd47487d9a57cdfc702326afb91c46879aca493b9ef0f392e148797f6b89afb1b2194a08abd96a076')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  "$pkgname" --completions bash | install -Dm 644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/$pkgname"
  "$pkgname" --completions fish | install -Dm 644 /dev/stdin "${pkgdir}/usr/share/fish/completions/$pkgname.fish"
  "$pkgname" --completions zsh | install -Dm 644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_$pkgname"
}
