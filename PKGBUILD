# Maintainer: Wing Hei Chan <whmunkchan@outlook.com>
# Contributor: HelloImWar <helloimwar at proton dot me>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

_lang=toml
_pkgname="tree-sitter-$_lang"
pkgname="$_pkgname-git"
pkgver=v0.5.1.r2.g8bd2056
pkgrel=3
pkgdesc="TOML grammar for tree-sitter"
arch=('x86_64')
url="https://github.com/ikatyang/tree-sitter-toml"
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
  cd "$_pkgname"/src
  cc $CFLAGS -fPIC -std=c99 -c parser.c
  cc $CFLAGS -fPIC -std=c99 -I. -c scanner.c
  cc $LDFLAGS -shared parser.o scanner.o \
    -o "$srcdir"/"$_pkgname"/lib"$_pkgname".so
}

package() {
  cd "$_pkgname"
  install -Dm755 -t "$pkgdir"/usr/lib lib"$_pkgname".so
  install -d "$pkgdir"/usr/lib/tree_sitter
  ln -s /usr/lib/lib"$_pkgname".so \
    "$pkgdir"/usr/lib/tree_sitter/"$_lang".so

  install -Dm644 -t "$pkgdir"/usr/share/doc/"$_pkgname" README.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/"$_pkgname" LICENSE
}
# Local Variables:
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
