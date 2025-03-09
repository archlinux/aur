# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-regex-git
pkgver=1.0.0.r34.gb638d29
pkgrel=3
pkgdesc="Regex grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-regex"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-regex=$pkgver" 'libtree-sitter-regex.so')
conflicts=('tree-sitter-regex')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-regex.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-regex"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-regex"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-regex"

  #tree-sitter test
}

package() {
  cd "tree-sitter-regex"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-regex"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-regex"
}
