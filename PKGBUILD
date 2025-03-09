# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-scala-git
pkgver=0.23.4.r4.gd67fe3b
pkgrel=3
pkgdesc="Scala grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-scala"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-scala=$pkgver" 'libtree-sitter-scala.so')
conflicts=('tree-sitter-scala')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-scala.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-scala"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-scala"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-scala"

  #tree-sitter test
}

package() {
  cd "tree-sitter-scala"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-scala"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-scala"
}
