# Maintainer : Daniel Bermond <dbermond@archlinux.org>

_target=mipsel-linux-gnu
pkgname="${_target}-binutils"
pkgver=2.40
pkgrel=1
pkgdesc='Tools to assemble and manipulate binary and object files for the MIPSEL target (for the toolchain with GNU C library)'
arch=('x86_64')
url='https://www.gnu.org/software/binutils/'
license=('GPL')
depends=('libelf' 'zlib')
options=('!emptydirs' 'staticlibs' '!distcc' '!ccache')
source=("https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz"{,.sig}
        '010-binutils-build-fix.patch')
sha256sums=('0f8a4c272d7f17f369ded10a4aca28b8e304828e95526da482b0ccc4dfc9d8e1'
            'SKIP'
            'fa145a2c8b0db6215b686a16873c236134322083d50e775afaf9f60a81dafbf3')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton

prepare() {
    mkdir -p build
    patch -d "binutils-${pkgver}" -Np1 -i "${srcdir}/010-binutils-build-fix.patch"
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
