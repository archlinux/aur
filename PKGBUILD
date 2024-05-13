# Maintainer: Wing Hei Chan <whmunkchan@outlook.com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

_lang=rust
_pkgname="tree-sitter-$_lang"
pkgname="$_pkgname-git"
pkgver=v0.21.2.r2.g9c84af0
pkgrel=1
pkgdesc="Rust grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/tree-sitter/tree-sitter-rust"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('git' 'tree-sitter-cli')
optdepends=('tree-sitter: core library')
provides=("lib$_pkgname.so")
source=("$_pkgname::git+$url")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 \
    | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
  cd "$_pkgname"
  tree-sitter generate --no-bindings src/grammar.json
}

build() {
  cd "$_pkgname"
  make PREFIX=/usr PARSER_URL="$url"
}

package() {
  install -d "$pkgdir"/usr/lib/tree_sitter
  ln -s /usr/lib/lib"$_pkgname".so \
    "$pkgdir"/usr/lib/tree_sitter/"$_lang".so

  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 -t "$pkgdir"/usr/share/doc/"$_pkgname" README.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/"$_pkgname" LICENSE
}
# Local Variables:
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
