# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-meson
pkgver=1.3.0
pkgrel=3
pkgdesc="Meson grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter-grammars/tree-sitter-meson"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('cmake' 'tree-sitter-cli')
provides=('libtree-sitter-meson.so')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/tree-sitter-grammars/tree-sitter-meson/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe9923e14405edfc41d76a1ffa82c8a03d8cf42e8651459a57882a55c00c83ea')


build() {
  cd "$pkgname-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "$pkgname-$pkgver"

  #cmake --build "_build" --target test
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-meson"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-meson"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/neovim/-/blob/390a730f1f0e85d48b3e49c69421cc7baeb3e00d/PKGBUILD#L74-76
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/libtree-sitter-meson.so" "$pkgdir/usr/lib/tree_sitter/meson.so"
}
