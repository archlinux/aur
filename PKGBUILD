# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target=arm-linux-gnueabihf
pkgname=${_target}-gdb
pkgver=16.3
pkgrel=3
pkgdesc='The GNU Debugger'
arch=(x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL-3.0-or-later)
depends=(boost expat gdb-common glibc gmp guile libelf mpfr ncurses python readline source-highlight xz zstd)
makedepends=(boost expat gcc glibc gmp guile libelf mpfr ncurses python readline source-highlight xz zstd)
options=(!emptydirs !strip)
source=(http://ftpmirror.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz{,.sig}
        fix-missing-includes.patch)
sha256sums=('bcfcd095528a987917acf9fff3f1672181694926cc18d609c99d0042c00224c5'
            'SKIP'
            '008c3d2e9f3f14ca2c73e59e8fcb268bd6624aa0ebe2fda072f9fec4d9165626')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker <brobecker@adacore.com>

prepare() {
  mkdir -p "${srcdir}"/gdb-build

  cd "${srcdir}"/gdb-${pkgver}
  patch -Np1 -i "${srcdir}"/fix-missing-includes.patch
}

build() {
  cd gdb-build

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
