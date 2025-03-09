# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-markdown-git
pkgver=0.3.2.r9.g192407a
pkgrel=2
pkgdesc="Markdown grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-markdown"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-markdown=$pkgver" 'libtree-sitter-markdown.so')
conflicts=('tree-sitter-markdown')
options=('staticlibs')
source=("git+https://github.com/tree-sitter-grammars/tree-sitter-markdown.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-markdown"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-markdown"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-markdown"

  #make test
}

package() {
  cd "tree-sitter-markdown"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-markdown"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-markdown"
}
