# Contributor: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target=arm-linux-gnueabihf
pkgname=${_target}-gdb
pkgver=14.1
pkgrel=1
pkgdesc='The GNU Debugger'
arch=(x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(boost expat gdb-common glibc gmp guile libelf mpfr ncurses python readline source-highlight xz zstd)
makedepends=(boost expat gcc glibc gmp guile libelf mpfr ncurses python readline source-highlight xz zstd)
options=(!emptydirs)
source=(http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz{,.sig})
sha256sums=('d66df51276143451fcbff464cc8723d68f1e9df45a6a2d5635a54e71643edb80'
            'SKIP')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker <brobecker@adacore.com>

prepare() {
  mkdir -p gdb-build
}

build() {
  cd gdb-${pkgver}

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  cd ${srcdir}/gdb-build

  ../gdb-${pkgver}/configure \
    --target=$_target \
    --prefix=/usr \
    --with-system-readline \
    --with-python=/usr/bin/python \
    --with-system-gdbinit=/etc/gdb/gdbinit \
    --enable-languages=c,c++ \
    --enable-tui \
    --enable-interwork \
    --enable-source-highlight \
    --disable-nls \
    --disable-multilib

  make
}

package() {
  cd gdb-build

  make -C gdb DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/usr/share/{gdb,info,man/man5}
  rm -r "${pkgdir}"/usr/include/gdb

  # strip it manually
  find "${pkgdir}"/usr/bin -type f -exec strip --strip-unneeded {} \; 2>/dev/null || true
}
