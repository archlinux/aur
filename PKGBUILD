# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Thomas <thomas at 6f dot io>

pkgname=jujutsu
pkgver=0.4.0
pkgrel=1
pkgdesc='A git-compatible DVCS'
arch=('x86_64')
url='https://github.com/martinvonz/jj'
license=('Apache')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'rust')
options=('!lto')
_commit='6efa47814accfa444a0fb60ee984b2a5c9746432'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  cargo build --frozen --release --all-features

  for shell in bash fish zsh; do
    ./target/release/jj debug completion "--$shell" > "jj.$shell"
  done
}

check() {
  cd "$pkgname"

  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/jj

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"

  # shell completions
  install -vDm644 jj.bash "$pkgdir/usr/share/bash-completion/completions/jj"
  install -vDm644 jj.fish "$pkgdir/usr/share/fish/vendor_completions.d/jj.fish"
  install -vDm644 jj.zsh "$pkgdir/usr/share/zsh/site-functions/_jj"
}
