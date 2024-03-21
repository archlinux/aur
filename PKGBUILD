# Maintainer: Wing Hei Chan <whmunkchan@outlook.com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

_pkgname=tree-sitter-rust
pkgname="$_pkgname-git"
pkgver=v0.20.4.r25.g3a56481
pkgrel=1
pkgdesc="Rust grammar for tree-sitter."
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-rust"
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
  cc $CFLAGS -std=c99 -c parser.c scanner.c
  cc $LDFLAGS -shared parser.o scanner.o \
    -o "$srcdir/libtree-sitter-rust.so"
}

package() {
  install -Dm 644 {,"$pkgdir/usr/lib/"}libtree-sitter-rust.so

  local nvim="$pkgdir/usr/share/nvim/runtime/parser"
  mkdir -p "$nvim"
  ln -s /usr/lib/libtree-sitter-rust.so "$nvim/rust.so"

  install -Dm 644 "$_pkgname/LICENSE" -t \
    "$pkgdir/usr/share/licenses/$pkgname"
}
# Local Variables:
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
