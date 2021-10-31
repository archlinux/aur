# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_target=mips64-linux-gnu
pkgname="${_target}-gdb"
pkgver=11.1
pkgrel=1
pkgdesc='The GNU Debugger for the MIPS64 target (for the toolchain with GNU C library and multilib ABI)'
arch=('x86_64')
url='https://www.gnu.org/software/gdb/'
license=('GPL3')
depends=('expat' 'gdb-common' 'guile' 'libelf' 'ncurses' 'mpfr' 'python' 'source-highlight' 'xz')
options=('!emptydirs')
source=("https://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz"{,.sig}
        '010-gdb-fix-build.patch')
sha256sums=('cccfcc407b20d343fb320d4a9a2110776dd3165118ffd41f4b1b162340333f94'
            'SKIP'
            '9d21568bc109a13e37b27274815ba1a3cd4c16b19cc0bd555441bbe5ed1dc6ff')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker

prepare() {
    mkdir -p build
    patch -d "gdb-${pkgver}" -Np1 -i "${srcdir}/010-gdb-fix-build.patch"
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
