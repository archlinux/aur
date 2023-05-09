# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: desbma

pkgname=zoxide
pkgver=0.9.1
pkgrel=1
pkgdesc='A smarter cd command for your terminal'
arch=('x86_64')
url='https://github.com/ajeetdsouza/zoxide'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
optdepends=(
  'fzf: for interactive selection'
)
options=('!lto')
_commit='686d116ad54635d0ea86b69b7a00238ebc0a8bbb'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" man/man1/*.1

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # shell auto-completions
  cd contrib/completions
  install -vDm644 -t "$pkgdir/usr/share/zsh/site-functions" _zoxide
  install -vDm644 -t "$pkgdir/usr/share/fish/vendor_completions.d" zoxide.fish
  install -vDm644 zoxide.bash "$pkgdir/usr/share/bash-completion/completions/zoxide"
}
