# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-html-git
pkgver=0.23.2.r4.gcbb91a0
pkgrel=3
pkgdesc="HTML grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-html"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-html=$pkgver" 'libtree-sitter-html.so')
conflicts=('tree-sitter-html')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-html.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-html"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-html"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-html"

  #tree-sitter test
}

package() {
  cd "tree-sitter-html"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-html"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-html"
}
