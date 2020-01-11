# Maintainer: Ryan Suchocki <ryan@suchocki.co.uk>
# Maintainer: Martin Kröning <m.kroening@hotmail.de>
_target=riscv64-unknown-elf
pkgname=$_target-gdb
pkgver=8.3.1
pkgrel=1
pkgdesc='The GNU Debugger for the 32bit and 64bit RISC-V bare-metal target'
arch=(x86_64)
url='https://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(xz ncurses expat python guile2.0 gdb-common mpfr)
options=(!emptydirs)
source=(https://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz{,.sig})
sha256sums=('1e55b4d7cdca7b34be12f4ceae651623aa73b2fd640152313f9f66a7149757c4'
            'SKIP')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker

prepare() {
  cd gdb-$pkgver

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd gdb-$pkgver

  ./configure \
    --target=$_target \
    --prefix=/usr \
    --enable-languages=c,c++ \
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

  make -C gdb DESTDIR=$pkgdir install

  # Following files conflict with 'gdb'/'gdb-common' packages
  rm -r $pkgdir/usr/include/gdb/
  rm -r $pkgdir/usr/share/gdb/
  rm -r $pkgdir/usr/share/info/
  rm -r $pkgdir/usr/share/man/man5/
}
