# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-go-git
pkgver=0.23.4.r4.g5e73f47
pkgrel=3
pkgdesc="Go grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-go"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-go=$pkgver" 'libtree-sitter-go.so')
conflicts=('tree-sitter-go')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-go.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-go"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-go"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-go"

  #tree-sitter test
}

package() {
  cd "tree-sitter-go"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-go"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-go"
}
