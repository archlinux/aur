# Maintainer: Aviel Warschawski <mail@aviel.org>

pkgname=gdb-multiarch
pkgver=8.2
pkgrel=1
pkgdesc='The GNU Debugger for all gdb supported architectures (i386/arm/mips...)'
arch=(i686 x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(xz ncurses expat python guile2.0 gdb-common)
options=(!emptydirs)
source=(https://ftp.gnu.org/gnu/gdb/gdb-8.2.tar.xz{,.sig})
sha256sums=('c3a441a29c7c89720b734e5a9c6289c0a06be7e0c76ef538f7bbcef389347c39'
            'SKIP')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker <brobecker@adacore.com>

prepare() {
  cd gdb-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd gdb-$pkgver

  ./configure \
    --enable-targets=all \
    --prefix=/build \
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

  make DESTDIR="$pkgdir" install

  # Following files conflict with 'gdb' package
  mkdir -p "$pkgdir"/usr/bin
  mv "$pkgdir"/build/bin/gdb "$pkgdir"/usr/bin/gdb-multiarch
  rm -r "$pkgdir"/build
}
