# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dra
pkgver=0.4.0
pkgrel=1
pkgdesc="A command line tool to download assets from GitHub releases"
arch=('x86_64')
url="https://github.com/devmatteini/dra"
license=('MIT')
depends=('xz' 'zlib' 'bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('145a1dbf032ed8d6968331dbe6a14700fc8cab49e925115ad9692ffee8cd6a4a75a3c8ba9b8d4150a7a4a13e884b66ec9ac3418ab44ba8e5fe770d8405cd17fb')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  mkdir -p completions
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
  local _completion="target/release/$pkgname completion"
  $_completion bash > "completions/$pkgname"
  $_completion fish > "completions/$pkgname.fish"
  $_completion zsh  > "completions/_$pkgname"
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --bins
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "completions/$pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
