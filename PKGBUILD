# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-r-git
pkgver=1.2.0.r13.g0e6ef77
pkgrel=1
pkgdesc="R grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/r-lib/tree-sitter-r"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-r=$pkgver" 'libtree-sitter-r.so')
conflicts=('tree-sitter-r')
options=('staticlibs')
source=("git+https://github.com/r-lib/tree-sitter-r.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-r"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-r"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-r"

  #tree-sitter test
}

package() {
  cd "tree-sitter-r"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-r"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-r"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/neovim/-/blob/390a730f1f0e85d48b3e49c69421cc7baeb3e00d/PKGBUILD#L74-76
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/libtree-sitter-r.so" "$pkgdir/usr/lib/tree_sitter/r.so"
}
