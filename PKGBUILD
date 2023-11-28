# Maintainer: Wing Hei Chan <whmunkchan@outlook.com>
_pkgname=tree-sitter-typst
pkgname="$_pkgname-git"
pkgver=v0.9.0.1.r13.g1651d6e
pkgrel=1
pkgdesc="A TreeSitter grammar for the Typst language."
arch=('x86_64')
url="https://github.com/uben0/tree-sitter-typst"
license=('MIT')
makedepends=('git' 'npm' 'tree-sitter' 'tree-sitter-cli')
provides=("$_pkgname")
source=("$_pkgname::git+$url")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 \
    | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
  cd "$_pkgname"
  tree-sitter generate
}

build() {
  cd "$_pkgname/src"
  cc $CFLAGS -fPIC -std=c99 -c parser.c
  cc $CFLAGS -fPIC -std=c99 -c scanner.c
  cc $LDFLAGS -shared parser.o scanner.o \
    -o "$srcdir/libtree-sitter-typst.so"
}

package() {
  install -Dm 644 {,"$pkgdir/usr/lib/"}libtree-sitter-typst.so

  local nvim="$pkgdir/usr/share/nvim/runtime/parser"
  mkdir -p "$nvim"
  ln -s /usr/lib/libtree-sitter-typst.so "$nvim/typst.so"

  install -Dm 644 "$_pkgname/LICENSE" -t \
    "$pkgdir/usr/share/licenses/$pkgname"
}
# Local Variables:
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
