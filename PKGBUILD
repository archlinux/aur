# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs
_pkgname=dotter
pkgver=0.12.16
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("$_pkgname")
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('96100942125d358704ea315ff76c0ab7306d73d07b7f6c864e2b497ab4bc70ac7e7d1725d08a257a3afc37c214c89d0ad82c6a50c443eb0f5a6da973aeb1a888')

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
