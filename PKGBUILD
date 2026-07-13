# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs
_pkgname=dotter
pkgver=0.13.5
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname")
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3c03e3f24248e0769e9f19e1dd0838fb9e67e8f89490fbbfc49399fe008341854885c9feb0b9e1ae5cbc01fb367e2483aea33298391309f8000697cb272e072c')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  mkdir completions
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --frozen
  local _completion="target/release/$_pkgname gen-completions --shell"
  $_completion bash > "completions/$_pkgname"
  $_completion fish > "completions/$_pkgname.fish"
  $_completion zsh  > "completions/_$_pkgname"
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "completions/$_pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
