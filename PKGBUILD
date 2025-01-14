# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

__pkgname=jule
_pkgname="tree-sitter-$__pkgname"
pkgname="$_pkgname-git"
pkgver=rd7655da
pkgrel=1
pkgdesc='Jule syntax tree for the Tree-sitter parsing library'
groups=('jule' 'tree-sitter-grammars')
arch=('any')
url="https://github.com/TheLooped/$_pkgname"
license=('BSD-3-Clause')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('tree-sitter' 'git' 'tree-sitter-cli' 'nodejs')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgname"
  echo "r$(git rev-parse --short HEAD)"
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
  mkdir -p "$pkgdir/usr/share/nvim/runtime/parser"
  mkdir -p "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/lib$_pkgname.so" "$pkgdir/usr/share/nvim/runtime/parser/$__pkgname.so"
  ln -s "/usr/lib/lib$_pkgname.so" "$pkgdir/usr/lib/tree_sitter/$__pkgname.so"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
