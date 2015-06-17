# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_target=aarch64-linux-gnu
pkgname=$_target-gdb
pkgver=7.9
pkgrel=1
pkgdesc='The GNU Debugger for the ARM64 target'
arch=(i686 x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(xz ncurses expat python2 guile)
makedepends=(texinfo)
options=(!emptydirs)
source=(ftp://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz)
sha256sums=('9b315651a16528f7af8c7d8284699fb0c965df316cc7339bb0b7bae335848392')

build() {
  cd gdb-$pkgver

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  ./configure --target=$_target \
              --prefix=/usr \
              --enable-multilib \
              --enable-interwork \
              --with-system-readline \
              --disable-nls \
              --with-python=/usr/bin/python2 \
              --with-system-gdbinit=/etc/gdb/gdbinit
  make
}

package() {
  cd gdb-$pkgver

  make DESTDIR="$pkgdir" install

  # Following files conflict with 'gdb' package
  rm -r "$pkgdir"/usr/share/info
  # TOTHINK: we remove python module used for debugging. It means arm-*-gdb alone will not be able to debug and 'gdb' package
  # should be installed. File a bug upstream - ask a separate python module folder for cross tools.
  rm -r "$pkgdir"/usr/share/gdb
  rm -r "$pkgdir"/usr/include/gdb
  rm -r "$pkgdir"/usr/share/man/man5
}
