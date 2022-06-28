# Maintainer: Ondřej Hošek <ondra dot hosek at gmail dot com>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Andrew Sun  <adsun701 at gmail dot com>
# Contributor: Kritias     <theodoridisgr at gmail dot com>
# Contributor: sudokode    <sudokode at gmail dot com>
# Contributor: Allan McRae <allan at archlinux dot org>

pkgname=libisl-git
pkgbase=isl-git
pkgver=0.24.332.geb702ee7
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints (development version)"
arch=('i686' 'x86_64')
url="https://libisl.sourceforge.io/"
depends=('gmp')
makedepends=('clang' 'llvm')
license=('MIT')
options=('!libtool')
provides=('isl' 'libisl')
conflicts=('isl' 'libisl')
source=("${pkgname%-git}::git+https://repo.or.cz/isl.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --always | sed -e 's|^isl-||' -e 's|-|.|g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./autogen.sh
  ./configure --prefix=/usr --with-clang=system
  make
}

check() {
  cd "$srcdir/${pkgname%-git}"
  make check
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make -j1 DESTDIR="$pkgdir/" install

  install -dm755 "$pkgdir/usr/share/gdb/auto-load/usr/lib/"
  mv "${pkgdir}"/usr/lib/libisl.so.*-gdb.py "${pkgdir}"/usr/share/gdb/auto-load/usr/lib/

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/isl/LICENSE"
}
