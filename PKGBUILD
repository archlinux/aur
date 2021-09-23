_target=aarch64-none-elf
pkgname=$_target-gdb
pkgver=11.1
pkgrel=1
pkgdesc='The GNU Debugger for the ARM64 target'
arch=(i686 x86_64)
url='https://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(xz ncurses expat python guile2.0 gdb-common)
options=(!emptydirs)
source=(https://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz{,.sig})
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker
sha256sums=('cccfcc407b20d343fb320d4a9a2110776dd3165118ffd41f4b1b162340333f94'
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

  make DESTDIR="$pkgdir" install

  # Following files conflict with 'gdb' package
  rm -r "$pkgdir"/usr/share/info
  rm -r "$pkgdir"/usr/share/gdb
  rm -r "$pkgdir"/usr/include/gdb
  rm -r "$pkgdir"/usr/share/man/man5
}
