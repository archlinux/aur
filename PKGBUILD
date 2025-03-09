# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-lua-git
pkgver=0.2.0.r4.g68d29aa
pkgrel=2
pkgdesc="Lua grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-lua"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-lua=$pkgver" 'libtree-sitter-lua.so')
conflicts=('tree-sitter-lua')
options=('staticlibs')
source=("git+https://github.com/tree-sitter-grammars/tree-sitter-lua.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-lua"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-lua"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-lua"

  #tree-sitter test
}

package() {
  cd "tree-sitter-lua"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/tree-sitter-lua"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-lua"
}
