# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: desbma

pkgname=zoxide
pkgver=0.7.7
pkgrel=1
pkgdesc="A smarter cd command for your terminal"
arch=('x86_64')
url="https://github.com/ajeetdsouza/zoxide"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
optdepends=(
  'fzf: for interactive selection'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b2c095601f4adc9d4dcb6d59733c73752e37e9014f446dc0d87aa31a5c3b3f4921bca5273f55a720d0c4d5e875c89f46512cb64e9234731a0e5f115c089e491c')
b2sums=('b3a38588d1e5ec493a9c80fc75f8a986cf2412871416d1aaa27a09cf2c12c194ba8215ac914396d2bb05b03c6fb577f3ae81451ce06c7cacab92cb7e11a911e6')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" man/*.1

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # shell auto-completions
  cd contrib/completions
  install -vDm644 -t "$pkgdir/usr/share/zsh/site-functions" _zoxide
  install -vDm644 -t "$pkgdir/usr/share/fish/vendor_completions.d" zoxide.fish
  install -vDm644 zoxide.bash "$pkgdir/usr/share/bash-completion/completions/zoxide"
}
