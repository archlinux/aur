# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: desbma

pkgname=zoxide
pkgver=0.7.4
pkgrel=2
pkgdesc="A smarter cd command for your terminal"
arch=('x86_64')
url="https://github.com/ajeetdsouza/zoxide"
license=('MIT')
makedepends=('rust')
optdepends=(
  'fzf: for interactive selection'
  'bash-completion: for shell auto-completion'
  'fish: for shell auto-completion'
  'zsh: for shell auto-completion'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('4aab73e81fae7f749e57fd5ab7e77f5819650b8cc112885ae7fd97d5ddadf306247e0f965875d7369280a32a40d00ac9e1f34189096ad166d7fe33bcccfe663f')

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
