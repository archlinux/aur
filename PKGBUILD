# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-cli-git
pkgver=0.25.6.r109.g0fdf5695
pkgrel=1
pkgdesc="CLI tool for developing, testing, and using Tree-sitter parsers"
arch=('i686' 'x86_64')
url="https://tree-sitter.github.io/tree-sitter/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("tree-sitter-cli=$pkgver")
conflicts=('tree-sitter-cli')
options=('!lto')
source=("git+https://github.com/tree-sitter/tree-sitter.git")
sha256sums=('SKIP')


prepare() {
  cd "tree-sitter"

  if [ ! -f "Cargo.lock" ]; then
    cargo update \
      --manifest-path "crates/cli/Cargo.toml"
  fi
  cargo fetch \
    --manifest-path "crates/cli/Cargo.toml"
}

pkgver() {
  cd "tree-sitter"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "tree-sitter"

  #cargo test \
  #  --frozen
}

package() {
  cd "tree-sitter"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/tree-sitter/crates/cli"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-cli"
}
