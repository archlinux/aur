# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_target=mips64el-linux-gnu
pkgname="${_target}-binutils"
pkgver=2.37
pkgrel=1
pkgdesc='Tools to assemble and manipulate binary and object files for the MIPS64EL target (for the toolchain with GNU C library and multilib ABI)'
arch=('x86_64')
url='https://www.gnu.org/software/binutils/'
license=('GPL')
depends=('libelf' 'zlib')
options=('!emptydirs' 'staticlibs' '!distcc' '!ccache')
_patchver='f26867fe4daec7299f59a82ae4a0d70cceb3e082'
source=("https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz"{,.sig}
        "010-binutils-mips64-default-to-64-emulation-g${_patchver:0:7}.patch"::"https://raw.githubusercontent.com/openembedded/openembedded-core/${_patchver}/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch"
        '020-binutils-build-fix.patch')
sha256sums=('820d9724f020a3e69cb337893a0b63c2db161dadcb0e06fc11dc29eb1e84a32c'
            'SKIP'
            '2e0c71612d770d3b9531fa66211ac7ef810ddbe6253efe440ec1a069b08926b9'
            '510296287d6e59b879e139e0b671ccc4d1ce5254b259a09dae4a20bacfe9cf63')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton

prepare() {
    mkdir -p build
    patch -d "binutils-${pkgver}" -Np1 -i "${srcdir}/010-binutils-mips64-default-to-64-emulation-g${_patchver:0:7}.patch"
    patch -d "binutils-${pkgver}" -Np1 -i "${srcdir}/020-binutils-build-fix.patch"
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
