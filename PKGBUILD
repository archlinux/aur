# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-agda-git
pkgver=1.3.3.r1.gb9b32fa
pkgrel=3
pkgdesc="Agda grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-agda"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-agda=$pkgver" 'libtree-sitter-agda.so')
conflicts=('tree-sitter-agda')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-agda.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-agda"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-agda"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-agda"

  #tree-sitter test
}

package() {
  cd "tree-sitter-agda"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-agda"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-agda"
}
