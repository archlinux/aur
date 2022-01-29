# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=sheldon
pkgver=0.6.6
pkgrel=2
pkgdesc="A fast and configurable shell plugin manager"
arch=('x86_64')
url="https://sheldon.cli.rs"
license=('Apache' 'MIT')
depends=('curl')
makedepends=('git' 'rust' 'mdbook-linkcheck')
options=('!lto')
_commit='31c6df8f7da1d9aed7b46d75bc6c0fd8a0616c54'
source=("git+https://github.com/rossmacarthur/sheldon.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # backport fix for tests
  git cherry-pick --no-commit 9aa06fdd5cb284daae8c48648d614e3823f3f9f3

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  # binary
  cargo build --frozen --release --all-features

  # documentation
  mdbook build docs
}

check() {
  cd "$pkgname"

  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/sheldon

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md

  # completions
  install -vDm644 completions/sheldon.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm644 completions/sheldon.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
