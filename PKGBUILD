# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=tree-sitter-markdown-git
pkgver=0.5.1.r0.g2dfd57f
pkgrel=2
pkgdesc="Markdown grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-markdown"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'cmake' 'tree-sitter-cli')
provides=("tree-sitter-markdown=$pkgver" 'libtree-sitter-markdown.so' 'libtree-sitter-markdown-inline.so')
conflicts=('tree-sitter-markdown')
source=("git+https://github.com/tree-sitter-grammars/tree-sitter-markdown.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-markdown"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-markdown"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "tree-sitter-markdown"

  #cmake --build "_build" --target test
}

package() {
  cd "tree-sitter-markdown"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-markdown"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-markdown"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/neovim/-/blob/390a730f1f0e85d48b3e49c69421cc7baeb3e00d/PKGBUILD#L74-76
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/libtree-sitter-markdown.so" "$pkgdir/usr/lib/tree_sitter/markdown.so"
  ln -s "/usr/lib/libtree-sitter-markdown-inline.so" "$pkgdir/usr/lib/tree_sitter/markdown-inline.so"
}
