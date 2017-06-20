# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=isl-git
pkgver=0.18.765.g2c2d5c36
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints (development version)"
arch=('i686' 'x86_64')
url="http://isl.gforge.inria.fr/"
depends=('gmp')
makedepends=('clang')
license=('MIT')
options=('!libtool')
provides=('isl')
conflicts=('isl')
source=("${pkgname%-git}::git+http://repo.or.cz/isl.git")
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

  install -dm755 $pkgdir/usr/share/gdb/auto-load/usr/lib/
  mv $pkgdir/{,/usr/share/gdb/auto-load/}usr/lib/libisl.so.15.3.0-gdb.py

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/isl/LICENSE
}
