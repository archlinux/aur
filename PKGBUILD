# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-json-git
pkgver=0.24.8.r4.g46aa487
pkgrel=3
pkgdesc="JSON grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-json"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-json=$pkgver" 'libtree-sitter-json.so')
conflicts=('tree-sitter-json')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-json.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-json"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-json"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-json"

  #tree-sitter test
}

package() {
  cd "tree-sitter-json"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-json"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-json"
}
