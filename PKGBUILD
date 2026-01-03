# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=tree-sitter-zig-git
pkgver=1.1.2.r8.g6479aa1
pkgrel=1
pkgdesc="Zig grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-zig"
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('git' 'tree-sitter-cli' 'zig')
provides=("tree-sitter-zig=$pkgver" 'libtree-sitter-zig.so')
conflicts=('tree-sitter-zig')
source=("git+https://github.com/tree-sitter-grammars/tree-sitter-zig.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-zig"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

package() {
  cd "tree-sitter-zig"

  zig build \
    --prefix-lib-dir "$pkgdir/usr/lib" \
    --release=safe
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-zig"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-zig"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/neovim/-/blob/390a730f1f0e85d48b3e49c69421cc7baeb3e00d/PKGBUILD#L74-76
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/libtree-sitter-zig.so" "$pkgdir/usr/lib/tree_sitter/zig.so"
}
