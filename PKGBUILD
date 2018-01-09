# Maintainer: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

_target=arm-linux-gnueabihf
pkgname=$_target-gdb
pkgver=8.0.1
pkgrel=1
pkgdesc='The GNU Debugger for the ARM hard float target'
arch=(x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(gdb-common)
options=(!emptydirs)
source=(http://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz)
sha256sums=('3dbd5f93e36ba2815ad0efab030dcd0c7b211d7b353a40a53f4c02d7d56295e3')

build() {
  cd gdb-$pkgver

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  ./configure --target=$_target \
              --prefix=/usr \
              --enable-multilib \
              --enable-interwork \
              --with-system-readline \
              --disable-nls \
              --with-python=/usr/bin/python3 \
              --with-guile=guile-2.0 \
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
