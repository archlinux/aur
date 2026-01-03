# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-meson-git
pkgver=1.3.0.r15.gd4fa3c7
pkgrel=1
pkgdesc="Meson grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-meson"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('git' 'cmake' 'tree-sitter-cli')
provides=("tree-sitter-meson=$pkgver" 'libtree-sitter-meson.so')
conflicts=('tree-sitter-meson')
source=("git+https://github.com/tree-sitter-grammars/tree-sitter-meson.git")
sha256sums=('SKIP')


pkgver() {
  cd "tree-sitter-meson"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tree-sitter-meson"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "tree-sitter-meson"

  #cmake --build "_build" --target test
}

package() {
  cd "tree-sitter-meson"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-meson"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-meson"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/neovim/-/blob/390a730f1f0e85d48b3e49c69421cc7baeb3e00d/PKGBUILD#L74-76
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/libtree-sitter-meson.so" "$pkgdir/usr/lib/tree_sitter/meson.so"
}
