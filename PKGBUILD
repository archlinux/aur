# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-zig-git
pkgver=1.1.2.r0.gb670c8d
pkgrel=2
pkgdesc="Zig grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-zig"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-zig=$pkgver" 'libtree-sitter-zig.so')
conflicts=('tree-sitter-zig')
options=('staticlibs')
source=("git+https://github.com/tree-sitter-grammars/tree-sitter-zig.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-zig"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-zig"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-zig"

  #tree-sitter test
}

package() {
  cd "tree-sitter-zig"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-zig"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-zig"
}
