# Maintainer: Ryan Suchocki <ryan@suchocki.co.uk>
# Maintainer: Martin Kröning <m.kroening@hotmail.de>

_target=riscv64-unknown-elf
pkgname=$_target-gdb
pkgver=10.1
pkgrel=1
pkgdesc='The GNU Debugger for the 32bit and 64bit RISC-V bare-metal target'
arch=(x86_64)
url='https://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(xz ncurses expat python guile gdb-common mpfr libelf)
options=(!emptydirs)
source=(https://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz{,.sig})
sha256sums=('f82f1eceeec14a3afa2de8d9b0d3c91d5a3820e23e0a01bbb70ef9f0276b62c0'
            'SKIP')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker <brobecker@adacore.com>

prepare() {
  cd gdb-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd gdb-$pkgver

  mkdir -p build && cd build
  ../configure \
    --target=$_target \
    --prefix=/usr \
    --enable-languages=c,c++ \
    --enable-multilib \
    --enable-interwork \
    --with-system-readline \
    --disable-nls \
    --with-python=/usr/bin/python \
    --with-guile=guile-2.2 \
    --with-system-gdbinit=/etc/gdb/gdbinit

  make
}

package() {
  cd gdb-$pkgver/build

  make -C gdb DESTDIR="$pkgdir" install

  # Following files conflict with 'gdb'/'gdb-common' packages
  rm -r "$pkgdir"/usr/include/gdb/
  rm -r "$pkgdir"/usr/share/gdb/
  rm -r "$pkgdir"/usr/share/info/
  rm -r "$pkgdir"/usr/share/man/man5/
}
