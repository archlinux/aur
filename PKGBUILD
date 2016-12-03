# Maintainer: Pierre-Olivier Vauboin <povauboin@gmail.com>

# Based on avr-gdb

_target=lm32-elf
pkgname=$_target-gdb
pkgver=7.12
pkgrel=1
pkgdesc='The GNU Debugger for LM32'
arch=(i686 x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(python guile ncurses expat xz)
options=(!emptydirs)
source=(ftp://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz{,.sig})
sha256sums=('834ff3c5948b30718343ea57b11cbc3235d7995c6a4f3a5cecec8c8114164f94'
            'SKIP')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker <brobecker@adacore.com>

prepare() {
  cd gdb-$pkgver

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd gdb-$pkgver

  ./configure \
    --disable-nls \
    --enable-languages=c,c++ \
    --prefix=/usr \
    --target=$_target \
    --with-python=/usr/bin/python3 \
    --with-system-readline \
    --with-system-gdbinit=/etc/gdb/gdbinit

  make
}

package() {
  cd gdb-$pkgver

  make DESTDIR="$pkgdir" install

  # Following files conflict with 'gdb' package
  rm -r "$pkgdir"/usr/share/info
  rm -r "$pkgdir"/usr/share/man
  rm -r "$pkgdir"/usr/share/gdb
  rm -r "$pkgdir"/usr/include/gdb
}
