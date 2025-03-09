# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-java-git
pkgver=0.23.5.r3.ga7db522
pkgrel=3
pkgdesc="Java grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-java"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-java=$pkgver" 'libtree-sitter-java.so')
conflicts=('tree-sitter-java')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-java.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-java"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-java"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-java"

  #tree-sitter test
}

package() {
  cd "tree-sitter-java"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-java"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-java"
}
