# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-cli-git
pkgver=0.20.9.r9.g78c297e6
pkgrel=1
pkgdesc="CLI tool for developing, testing, and using Tree-sitter parsers"
arch=('i686' 'x86_64')
url="https://tree-sitter.github.io/tree-sitter/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("tree-sitter-cli=$pkgver")
conflicts=('tree-sitter-cli')
source=("git+https://github.com/tree-sitter/tree-sitter.git")
sha256sums=('SKIP')


prepare() {
  cd "tree-sitter/cli"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "tree-sitter/cli"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "tree-sitter/cli"

  #cargo test \
  #  --frozen
}

package() {
  cd "tree-sitter"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-cli"

  cd "cli"
  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .
}
