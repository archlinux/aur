# Maintainer: Alexander Drozdov <adrozdoff@gmail.com>

_target=aarch64-none-elf
pkgname=$_target-gdb
pkgver=12.1
pkgrel=1
pkgdesc='The GNU Debugger for the ARM64 Baremetal target'
arch=(i686 x86_64)
url='https://www.gnu.org/software/gdb/'
license=(GPL3)
depends=('expat' 'gdb-common' 'guile' 'libelf' 'ncurses' 'mpfr' 'python' 'source-highlight' 'xz')
options=(!emptydirs)
source=(https://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz{,.sig})
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker
sha256sums=('0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed'
            'SKIP')

prepare() {
  cd gdb-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd gdb-$pkgver

  export CXXFLAGS="$CXXFLAGS -fpermissive"

  ./configure \
    --target=$_target \
    --prefix=/usr \
    --enable-languages=c,c++ \
    --disable-multilib \
    --enable-interwork \
    --enable-tui \
    --with-system-readline \
    --enable-source-highlight \
    --disable-nls \
    --with-python=/usr/bin/python \
    --with-guile=guile-3.0 \
    --with-system-gdbinit=/etc/gdb/gdbinit-aarch64-none

  make
}

package() {
  cd gdb-$pkgver

  make DESTDIR="$pkgdir" install

  # Following files conflict with 'gdb' package
  rm -r "$pkgdir"/usr/share/info
  rm -r "$pkgdir"/usr/share/gdb
  rm -r "$pkgdir"/usr/include/gdb
  rm -r "$pkgdir"/usr/share/man/man5
}
