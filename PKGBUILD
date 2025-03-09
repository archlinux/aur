# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-meson-git
pkgver=1.3.0.r1.g742a21e
pkgrel=2
pkgdesc="Meson grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-meson"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-meson=$pkgver" 'libtree-sitter-meson.so')
conflicts=('tree-sitter-meson')
options=('staticlibs')
source=("git+https://github.com/tree-sitter-grammars/tree-sitter-meson.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-meson"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-meson"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-meson"

  #make test
}

package() {
  cd "tree-sitter-meson"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-meson"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-meson"
}
