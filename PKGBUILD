# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-haskell-git
pkgver=0.23.1.r2.g0975ef7
pkgrel=3
pkgdesc="Haskell grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-haskell"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-haskell=$pkgver" 'libtree-sitter-haskell.so')
conflicts=('tree-sitter-haskell')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-haskell.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-haskell"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-haskell"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-haskell"

  #tree-sitter test
}

package() {
  cd "tree-sitter-haskell"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-haskell"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-haskell"
}
