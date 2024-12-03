# Contributor: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target=arm-linux-gnueabihf
pkgname=${_target}-gdb
pkgver=15.2
pkgrel=1
pkgdesc='The GNU Debugger'
arch=(x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(boost expat gdb-common glibc gmp guile libelf mpfr ncurses python readline source-highlight xz zstd)
makedepends=(boost expat gcc glibc gmp guile libelf mpfr ncurses python readline source-highlight xz zstd)
options=(!emptydirs !strip)
source=(http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz{,.sig})
sha256sums=('83350ccd35b5b5a0cba6b334c41294ea968158c573940904f00b92f76345314d'
            'SKIP')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker <brobecker@adacore.com>

prepare() {
  mkdir -p gdb-build
}

build() {
  #cd gdb-${pkgver}

  #sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  cd ${srcdir}/gdb-build

  ../gdb-${pkgver}/configure \
    --target=${_target} \
    --prefix=/usr \
    --with-system-readline \
    --with-python=/usr/bin/python \
    --with-system-gdbinit=/etc/gdb/gdbinit \
    --enable-languages=c,c++ \
    --enable-tui \
    --enable-interwork \
    --enable-source-highlight \
    --disable-nls \
    --disable-multilib \
    --disable-sim

  make
}

package() {
  cd gdb-build

  make -C gdb DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/usr/share/{gdb,info,man/man5}
  rm -r "${pkgdir}"/usr/include/gdb

  # strip it manually
  find "${pkgdir}"/ -type f -and \( -name \*.a -or -name \*.o \) \
    -exec ${_target}-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges \
    -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line \
    -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;
  find "${pkgdir}"/ -type f -and \( -executable \) -exec strip '{}' \;
}
