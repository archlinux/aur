# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-kotlin-git
pkgver=1.1.0.r1.g3dea6df
pkgrel=2
pkgdesc="Kotlin grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-kotlin"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-kotlin=$pkgver" 'libtree-sitter-kotlin.so')
conflicts=('tree-sitter-kotlin')
options=('staticlibs')
source=("git+https://github.com/tree-sitter-grammars/tree-sitter-kotlin.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-kotlin"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-kotlin"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-kotlin"

  #tree-sitter test
}

package() {
  cd "tree-sitter-kotlin"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-kotlin"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-kotlin"
}
