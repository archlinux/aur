# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_target=mips64el-linux-gnu
pkgname="${_target}-binutils"
pkgver=2.45
pkgrel=1
pkgdesc='Tools to assemble and manipulate binary and object files for the MIPS64EL target (for the toolchain with GNU C library and multilib ABI)'
arch=('x86_64')
url='https://www.gnu.org/software/binutils/'
license=('GPL-3.0-or-later')
depends=('libelf' 'zlib')
options=('!ccache' '!distcc' '!emptydirs' 'staticlibs')
source=("https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz"{,.sig})
sha256sums=('c50c0e7f9cb188980e2cc97e4537626b1672441815587f1eab69d2a1bfbef5d2'
            'SKIP')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton

prepare() {
    mkdir -p build
}

build() {
    cd build
    "${srcdir}/binutils-${pkgver}/configure" \
        --build="$CHOST" \
        --host="$CHOST" \
        --target="$_target" \
        --prefix='/usr' \
        --with-sysroot="/usr/${_target}" \
        --enable-cet \
        --enable-deterministic-archives \
        --enable-new-dtags \
        --enable-gold \
        --enable-ld='default' \
        --enable-lto \
        --enable-plugins \
        --enable-relro \
        --enable-threads \
        --enable-multilib \
        --disable-gdb \
        --disable-werror \
        --with-debuginfod \
        --with-pic \
        --with-system-zlib \
        --with-gnu-as \
        --with-gnu-ld
    make
}

check() {
    # unset LDFLAGS as testsuite makes assumptions about which ones are active
    # ignore failures in gold testsuite...
    make -C build -k LDFLAGS='' check || true
}

package() {
    make -C build DESTDIR="$pkgdir" install
    
    # remove unwanted Windows files
    rm "${pkgdir}/usr/share/man/man1/${_target}"-{dlltool,windmc,windres}*
    
    # remove conflicting files
    rm -r "${pkgdir}/usr"/{lib/bfd-plugins,share/{info,locale}}
    
    # replace cross-directory hardlinks with symlinks
    local _file
    rm "${pkgdir}/usr/${_target}/bin"/*
    while read -r -d '' _file
    do
        ln -s "../../bin/${_file##*/}" "${pkgdir}/usr/${_target}/bin/${_file##*"${_target}-"}"
    done < <(find "${pkgdir}/usr/bin" -type f -print0)
}
