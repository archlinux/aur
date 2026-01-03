# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-verilog
pkgver=1.0.3
pkgrel=3
pkgdesc="SystemVerilog grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-verilog"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('nodejs' 'tree-sitter-cli')
provides=('libtree-sitter-verilog.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/tree-sitter/tree-sitter-verilog/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b985c74fa7d0035db7415908935cf1ba7eea3d928ccebfa1d89541d5b6fa7b4')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-verilog"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-verilog"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/neovim/-/blob/390a730f1f0e85d48b3e49c69421cc7baeb3e00d/PKGBUILD#L74-76
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/libtree-sitter-verilog.so" "$pkgdir/usr/lib/tree_sitter/verilog.so"
}
