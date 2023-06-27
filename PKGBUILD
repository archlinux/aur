# Maintainer: Alexander Drozdov <adrozdoff@gmail.com>

_target=aarch64-none-elf
pkgname=$_target-gdb
pkgver=13.1
pkgrel=2
pkgdesc='The GNU Debugger for the ARM64 Baremetal target'
arch=(i686 x86_64)
url='https://www.gnu.org/software/gdb/'
license=(GPL3)
depends=('expat' 'gdb-common' 'guile' 'libelf' 'ncurses' 'mpfr' 'python' 'source-highlight' 'xz')
options=(!emptydirs)
source=(https://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz{,.sig})
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker
sha256sums=('115ad5c18d69a6be2ab15882d365dda2a2211c14f480b3502c6eba576e2e95a0'
            'SKIP')

prepare() {
  cd "$srcdir/gdb-$pkgver"
  [[ -d gdb-build ]] && rm -rf gdb-build
  mkdir gdb-build
  #sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd "$srcdir/gdb-$pkgver/gdb-build"

  unset LDFLAGS
  export CFLAGS="-O2 -pipe"
  #export CXXFLAGS="-O2 -pipe"
  export CPPFLAGS="-O2 -pipe"
  export CXXFLAGS="-fpermissive -O2 -pipe"

  ../configure \
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
    --with-guile \
    --disable-werror

  make
}

package() {
  cd "$srcdir/gdb-$pkgver/gdb-build"

  make DESTDIR="$pkgdir" install

  # Following files conflict with 'gdb' package
  rm -r ${pkgdir}/usr/share/info
  rm -r ${pkgdir}/usr/share/man
  rm -r ${pkgdir}/usr/share/gdb/
  rm -r ${pkgdir}/usr/include/gdb
  rm -r ${pkgdir}/usr/include/sim
}
