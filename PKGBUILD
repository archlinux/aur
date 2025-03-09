# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-vim-git
pkgver=0.4.0.r3.gf3cd62d
pkgrel=2
pkgdesc="Vimscript grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-vim"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-vim=$pkgver" 'libtree-sitter-vim.so')
conflicts=('tree-sitter-vim')
options=('staticlibs')
source=("git+https://github.com/tree-sitter-grammars/tree-sitter-vim.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-vim"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-vim"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-vim"

  #tree-sitter test
}

package() {
  cd "tree-sitter-vim"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-vim"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-vim"
}
