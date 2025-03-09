# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-ocaml-git
pkgver=0.24.0.r4.gdb52ba3
pkgrel=3
pkgdesc="OCaml grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-ocaml"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-ocaml=$pkgver" 'libtree-sitter-ocaml.so')
conflicts=('tree-sitter-ocaml')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-ocaml.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-ocaml"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-ocaml"

  make generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-ocaml"

  #tree-sitter test
}

package() {
  cd "tree-sitter-ocaml"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-ocaml"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-ocaml"
}
