# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target=arm-frc-linux-gnueabi
pkgname=$_target-gdb
pkgver=7.12.1
pkgrel=2
pkgdesc="The GNU Debugger (${_target})"
arch=(i686 x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
groups=('frc-2017')
depends=(ncurses expat xz gdb-common=$pkgver)
makedepends=(texinfo python guile2.0 xz)
optdepends=('openocd: for debugging JTAG targets'
            'stlink: for debugging over STLINK')
options=(!emptydirs)
source=(ftp://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz)
sha256sums=('4607680b973d3ec92c30ad029f1b7dbde3876869e6b3a117d8a7e90081113186')

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
