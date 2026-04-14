# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tree-sitter-c-sharp
pkgver=0.23.4
pkgrel=1
pkgdesc="C# grammar for tree-sitter"
arch=('i686' 'x86_64')
url="https://github.com/tree-sitter/tree-sitter-c-sharp"
license=('MIT')
groups=('tree-sitter-grammars')
depends=('glibc')
makedepends=('nodejs' 'tree-sitter-cli')
provides=('libtree-sitter-c-sharp.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/tree-sitter/tree-sitter-c-sharp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3d0930ccf4ab6cba584584a1899c6b4285e96521d70438a965e5b0f9a450fe93')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tree-sitter-c-sharp"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/tree-sitter-c-sharp"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/neovim/-/blob/390a730f1f0e85d48b3e49c69421cc7baeb3e00d/PKGBUILD#L74-76
  install -d "$pkgdir/usr/lib/tree_sitter"
  ln -s "/usr/lib/libtree-sitter-c-sharp.so" "$pkgdir/usr/lib/tree_sitter/c-sharp.so"
}
