# Maintainer: kiasoc5 <kiasoc5 at disroot dot org>

_name=fibers
pkgname=guile-$_name
pkgver=1.2.0
pkgrel=1
# follow the same commit as guile-fibers-next on Guix
_commit=745bd409bef17284648805fb985777d21dba79f7
pkgdesc="Concurrent ML-like concurrency for Guile"
arch=(any)
license=(LGPL3+)
makedepends=(git)
depends=("guile>=2.1.7")
source=(git+https://github.com/wingo/${_name}.git#commit=${_commit})
url="https://github.com/wingo/fibers"
md5sums=('SKIP')
# shows warnings for .go files
options=(!strip)

build() {
  cd "$srcdir/$_name"
  autoreconf -vif
  ./configure --prefix=/usr
  GUILE_AUTO_COMPILE=0 make
}

package() {
  cd "$srcdir/$_name"
  GUILE_AUTO_COMPILE=0 make install DESTDIR="$pkgdir"
}

check() {
  cd "$srcdir/$_name"
  # This test can take more than an hour on some systems.
  sed -i -e "s/.*spawn-fiber loop-to-1e4.*//g" tests/basic.scm
  # These tests can take more than an hour and/or segfault.
  sed -i "s|tests/speedup.scm||g" Makefile
  GUILE_AUTO_COMPILE=0 make check
}
