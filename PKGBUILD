# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Valentín Kivachuk <vk18496@gmail.com>

_target=mips64-linux-gnu
pkgname="${_target}-binutils"
pkgver=2.38
pkgrel=1
pkgdesc='Tools to assemble and manipulate binary and object files for the MIPS64 target (for the toolchain with GNU C library and multilib ABI)'
arch=('x86_64')
url='https://www.gnu.org/software/binutils/'
license=('GPL')
depends=('libelf' 'zlib')
options=('!emptydirs' 'staticlibs' '!distcc' '!ccache')
_patchver='3dea562e9d615384cc5e786eff46ac1f8f41e18e'
source=("https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz"{,.sig}
        "010-binutils-mips64-default-to-64-emulation-g${_patchver:0:7}.patch"::"https://raw.githubusercontent.com/openembedded/openembedded-core/${_patchver}/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch")
sha256sums=('e316477a914f567eccc34d5d29785b8b0f5a10208d36bbacedcc39048ecfe024'
            'SKIP'
            '2e0c71612d770d3b9531fa66211ac7ef810ddbe6253efe440ec1a069b08926b9')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton

prepare() {
    mkdir -p build
    patch -d "binutils-${pkgver}" -Np1 -i "${srcdir}/010-binutils-mips64-default-to-64-emulation-g${_patchver:0:7}.patch"
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
