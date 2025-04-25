# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_target=mips64el-linux-gnu
pkgname="${_target}-gdb"
pkgver=16.3
pkgrel=1
pkgdesc='The GNU Debugger for the MIPS64EL target (for the toolchain with GNU C library and multilib ABI)'
arch=('x86_64')
url='https://www.gnu.org/software/gdb/'
license=('GPL-3.0-or-later')
depends=('expat' 'gdb-common' 'guile' 'libelf' 'ncurses' 'mpfr' 'python' 'xz')
options=('!emptydirs')
source=("https://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz"{,.sig})
sha256sums=('bcfcd095528a987917acf9fff3f1672181694926cc18d609c99d0042c00224c5'
            'SKIP')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker

prepare() {
    mkdir -p build
}

build() {
    cd build
    "${srcdir}/gdb-${pkgver}/configure" \
        --target="$_target" \
        --prefix='/usr' \
        --disable-nls \
        --disable-source-highlight \
        --enable-tui \
        --with-system-readline \
        --with-python='/usr/bin/python' \
        --with-system-gdbinit='/etc/gdb/gdbinit' \
        --enable-languages='c,c++,fortran' \
        --enable-multilib \
        --enable-interwork \
        --disable-werror
    make
}

package() {
    make -C build DESTDIR="$pkgdir" install
    rm -r "${pkgdir}/usr/include/gdb"
    rm -r "${pkgdir}/usr/share/gdb"
    rm -r "${pkgdir}/usr/share/info"
    rm -r "${pkgdir}/usr/share/man/man5"
    rm -r "${pkgdir}/usr/share/man/man1/${_target}-gdbserver.1"
}
