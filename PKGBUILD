# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target=arm-frc-linux-gnueabi
pkgname=$_target-gdb
pkgver=8.2
pkgrel=1
pkgdesc="The GNU Debugger (${_target})"
arch=(i686 x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
groups=('frc-toolchain')
depends=(ncurses expat xz mpfr gdb-common)
makedepends=(texinfo python guile2.0)
options=(!emptydirs)
source=(ftp://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz)
sha256sums=('c3a441a29c7c89720b734e5a9c6289c0a06be7e0c76ef538f7bbcef389347c39')

build() {
  cd gdb-$pkgver

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  ./configure --prefix=/usr \
              --target=${_target} \
              --disable-nls \
              --with-python=/usr/bin/python3 \
              --with-guile=guile-2.0 \
              --with-sysroot=/usr/${_target} \
              --enable-lto
  make
}

package() {
  cd gdb-$pkgver

  make DESTDIR="$pkgdir" install

  # fix conflicts with gdb
  rm -r $pkgdir/usr/include/gdb
  rm -r $pkgdir/usr/share/info

  # comes from gdb-common
  rm -r $pkgdir/usr/share/gdb
}
