# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-verilog-git
pkgver=0.0.r316.g9020313
pkgrel=1
pkgdesc="SystemVerilog grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-verilog"
license=('MIT')
makedepends=('git' 'tree-sitter-cli')
provides=("tree-sitter-verilog=$pkgver")
conflicts=('tree-sitter-verilog')
source=("git+https://github.com/tree-sitter/tree-sitter-verilog.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-verilog"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-verilog"

  tree-sitter generate

  cd "src"
  cc \
    $CFLAGS \
    $LDFLAGS \
    -shared \
    parser.c \
    -o libtree-sitter-verilog.so
}

check() {
  cd "tree-sitter-verilog"

  #tree-sitter test
}

package() {
  cd "tree-sitter-verilog"

  install -Dm644 "src/libtree-sitter-verilog.so" -t "$pkgdir/usr/lib"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-verilog"
}
