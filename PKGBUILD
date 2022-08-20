# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_target=mips64-linux-gnu
pkgname="${_target}-gdb"
pkgver=12.1
pkgrel=1
pkgdesc='The GNU Debugger for the MIPS64 target (for the toolchain with GNU C library and multilib ABI)'
arch=('x86_64')
url='https://www.gnu.org/software/gdb/'
license=('GPL3')
depends=('expat' 'gdb-common' 'guile' 'libelf' 'ncurses' 'mpfr' 'python' 'source-highlight' 'xz')
options=('!emptydirs')
source=("https://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz"{,.sig})
sha256sums=('0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed'
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
        --enable-source-highlight \
        --enable-tui \
        --with-system-readline \
        --with-python='/usr/bin/python' \
        --with-guile='guile-2.2' \
        --with-system-gdbinit='/etc/gdb/gdbinit' \
        --enable-languages='c,c++,fortran' \
        --enable-multilib \
        --enable-interwork
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
