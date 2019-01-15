# Maintainer: Mikhail Burakov <mikhail.burakov@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gdb-mini
pkgver=8.2.1
pkgrel=1
pkgdesc='The GNU Debugger without useless dependencies'
arch=(x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
makedepends=(texinfo)
source=(https://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz)
sha1sums=('023556a6d6effa1ffaadf0007cc4458cbe8dde3d')
provides=(gdb)
conflicts=(gdb)

prepare() {
  cd gdb-$pkgver

  # credits go to maintainers of original gdb PKGBUILD
  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd gdb-$pkgver
  ./configure --prefix=/usr --with-system-zlib --disable-nls --disable-tui \
      --disable-gdbserver --with-system-readline --without-expat \
      --without-mpfr --without-python --without-guile --without-intel-pt \
      --without-lzma --without-babeltrace
  make
}

package() {
  cd gdb-$pkgver
  make DESTDIR=$pkgdir install

  rm $pkgdir/usr/bin/gcore
  rm $pkgdir/usr/bin/gdb-add-index
  rm -r $pkgdir/usr/{include,lib,share}
}
