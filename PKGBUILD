# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_target=powerpc64-linux-gnu
pkgname=$_target-gdb
pkgver=15.1
pkgrel=1
pkgdesc='The GNU Debugger for the PPC64 target'
arch=(x86_64)
url='https://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(xz ncurses expat python guile gdb-common mpfr libelf source-highlight)
makedepends=(boost)
options=(!emptydirs)
source=(https://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz{,.sig})
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker
sha256sums=('38254eacd4572134bca9c5a5aa4d4ca564cbbd30c369d881f733fb6b903354f2'
            'SKIP')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker <brobecker@adacore.com>

build() {
  cd gdb-$pkgver

  mkdir -p build && cd build
  ../configure \
    --target=$_target \
    --prefix=/usr \
    --enable-languages=c,c++ \
    --disable-multilib \
    --enable-interwork \
    --with-system-readline \
    --disable-nls \
    --enable-source-highlight \
    --with-python=/usr/bin/python \
    --with-system-gdbinit=/etc/gdb/gdbinit

  make
}

package() {
  cd gdb-$pkgver/build

  make -C gdb DESTDIR="${pkgdir}" install

  # Following files conflict with 'gdb'/'gdb-common' packages
  rm -rf "${pkgdir}"/usr/include/gdb/
  rm -rf "${pkgdir}"/usr/share/gdb/
  rm -rf "${pkgdir}"/usr/share/info/
  rm -rf "${pkgdir}"/usr/share/man/man5/
}
