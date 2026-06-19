# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-r
pkgver=1.3.0
pkgrel=1
pkgdesc="R grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/r-lib/tree-sitter-r"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('nodejs' 'tree-sitter-cli')
provides=('libtree-sitter-r.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/r-lib/tree-sitter-r/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35dde81835046514f01c07e66d058c943bb44dd10823c04f7028374080b151dc')


build() {
  cd "$pkgname-$pkgver"

  tree-sitter generate
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  make
}

check() {
  cd "$pkgname-$pkgver"

  #tree-sitter test
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-r"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-r"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/neovim/-/blob/390a730f1f0e85d48b3e49c69421cc7baeb3e00d/PKGBUILD#L74-76
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/libtree-sitter-r.so" "$pkgdir/usr/lib/tree_sitter/r.so"
}
