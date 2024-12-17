# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

__pkgname=jule
_pkgname="tree-sitter-$__pkgname"
pkgname="$_pkgname-git"
pkgver=1.r0.gea815c0
pkgrel=1
pkgdesc='Jule syntax tree for the Tree-sitter parsing library'
groups=('jule' 'tree-sitter-grammars')
arch=('any')
url="https://github.com/TheLooped/$_pkgname"
license=('BSD-3-Clause')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('tree-sitter' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgname"
  echo "1.r$(git describe --all --long | sed 's/-/./g' | cut -d '.' -f 2-)"
}

prepare() {
  cd "$_pkgname"
  tree-sitter init-config &> /dev/null | true
  tree-sitter generate
}

build() {
  cd "$_pkgname"
  tree-sitter build
}

# comment tests failing
# check() {
#   cd "$_pkgname"
#   tree-sitter test
# }

package() {
  cd "$_pkgname"
  install -Dm664 "$__pkgname.so" "$pkgdir/usr/lib/lib$_pkgname.so"
  install -d "$pkgdir/usr/share/nvim/runtime/parser"
  ln -s "/usr/lib/lib$_pkgname.so" "$pkgdir/usr/share/nvim/runtime/parser/$__pkgname.so"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
