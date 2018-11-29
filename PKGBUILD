# Maintainer: Ryan Suchocki <ryan@suchocki.co.uk>

_target=riscv64-unknown-elf
pkgname=$_target-gdb
pkgver=8.2
pkgrel=1
pkgdesc='The GNU Debugger for the 32bit and 64bit RISC-V bare-metal target'
arch=(x86_64)
url='https://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(xz ncurses expat python guile2.0 gdb-common mpfr)
options=(!emptydirs)
source=(https://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz{,.sig})
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker
sha256sums=('c3a441a29c7c89720b734e5a9c6289c0a06be7e0c76ef538f7bbcef389347c39'
            'SKIP')

prepare() {
  cd gdb-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd gdb-$pkgver

  ./configure \
    --target=$_target \
    --prefix=/usr \
    --enable-languages=c,c++ \
    --disable-multilib \
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
  rm -r $pkgdir/usr/include/gdb
  rm -r $pkgdir/usr/share/gdb
  rm -r $pkgdir/usr/share/info
  rm -r $pkgdir/usr/share/man/man5
}
