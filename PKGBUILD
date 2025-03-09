# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-c-sharp-git
pkgver=0.23.1.r12.gb5eb574
pkgrel=3
pkgdesc="C# grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-c-sharp"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-c-sharp=$pkgver" 'libtree-sitter-c-sharp.so')
conflicts=('tree-sitter-c-sharp')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-c-sharp.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-c-sharp"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-c-sharp"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-c-sharp"

  #tree-sitter test
}

package() {
  cd "tree-sitter-c-sharp"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-c-sharp"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-c-sharp"
}
