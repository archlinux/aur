# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Valentín Kivachuk <vk18496@gmail.com>

_target=mips64-linux-gnu
pkgname="${_target}-binutils"
pkgver=2.39
pkgrel=1
pkgdesc='Tools to assemble and manipulate binary and object files for the MIPS64 target (for the toolchain with GNU C library and multilib ABI)'
arch=('x86_64')
url='https://www.gnu.org/software/binutils/'
license=('GPL')
depends=('libelf' 'zlib')
options=('!emptydirs' 'staticlibs' '!distcc' '!ccache')
_patchver='3dea562e9d615384cc5e786eff46ac1f8f41e18e'
source=("https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz"{,.sig}
        '010-binutils-mips64-default-to-64-emulation.patch')
sha256sums=('645c25f563b8adc0a81dbd6a41cffbf4d37083a382e02d5d3df4f65c09516d00'
            'SKIP'
            '44e1420a85f0209d72e7e6595006066492dcc0accb0eb3ae416e2659ec3f224b')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton

prepare() {
    mkdir -p build
    
    # https://github.com/openembedded/openembedded-core/blob/yocto-3.4.4/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
    patch -d "binutils-${pkgver}" -Np1 -i "${srcdir}/010-binutils-mips64-default-to-64-emulation.patch"
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
