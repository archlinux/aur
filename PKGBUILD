# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-julia-git
pkgver=0.25.0.r0.ge0f9dcd
pkgrel=1
pkgdesc="Julia grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-julia"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'nodejs' 'tree-sitter-cli')
provides=("tree-sitter-julia=$pkgver" 'libtree-sitter-julia.so')
conflicts=('tree-sitter-julia')
options=('staticlibs')
source=("git+https://github.com/tree-sitter/tree-sitter-julia.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-julia"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-julia"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "tree-sitter-julia"

  #tree-sitter test
}

package() {
  cd "tree-sitter-julia"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-julia"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-julia"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/neovim/-/blob/390a730f1f0e85d48b3e49c69421cc7baeb3e00d/PKGBUILD#L74-76
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/libtree-sitter-julia.so" "$pkgdir/usr/lib/tree_sitter/julia.so"
}
