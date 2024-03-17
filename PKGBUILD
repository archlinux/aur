# Maintainer: Jacko Dirks <jacko dot dirks at gmail dot com>
# Contributor: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=ghdl-gcc
pkgver=4.0.0
pkgrel=1
arch=('x86_64')
pkgdesc='VHDL simulator - GCC back-end'
url='https://github.com/ghdl/ghdl'
license=('GPL-2.0-only')

_gccver=12.3.0

provides=("ghdl=${pkgver}")
conflicts=('ghdl-gcc-git' 'ghdl-llvm-git' 'ghdl-mcode-git')
makedepends=('gmp' 'mpfr' 'mpc' 'gcc-ada' 'libisl' 'libmpc' 'zstd')
depends=('libmpc' 'zstd' 'libisl.so' "gcc-libs>=$_gccver" 'gcc-ada')
options=(!emptydirs !lto)

source=(
    "ghdl-${pkgver}.tar.gz::https://github.com/ghdl/ghdl/archive/refs/tags/v${pkgver}.tar.gz"
    "https://gcc.gnu.org/pub/gcc/releases/gcc-${_gccver}/gcc-${_gccver}.tar.xz"
)
sha256sums=(
    '97c88b36b73e7b5086366c1dd49a4224f3b200142b60c005305fc5c8a835740c'
    '949a5d4f99e786421a93b532b22ffab5578de7321369975b91aec97adfda8c3b'
)

prepare() {
    cd "${srcdir}"
    [[ ! -d gcc ]] && ln -sf gcc-${_gccver/+/-} gcc

    cd "${srcdir}/gcc"

    # Do not run fixincludes
    sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

    # Arch Linux installs libraries in /lib
    sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

    mkdir -p "${srcdir}/gcc-build"

    cd "${srcdir}/ghdl-${pkgver}"

    ./configure \
        GNATMAKE="gnatmake -R" \
        --prefix=/usr \
        --with-gcc="${srcdir}/gcc"

    make copy-sources

}

build() {
    cd "${srcdir}/gcc-build"

    # Credits @allanmcrae
    # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/gcc/PKGBUILD
    # TODO: properly deal with the build issues resulting from this
    CFLAGS=${CFLAGS/-Werror=format-security/}
    CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

    "${srcdir}"/gcc-${_gccver}/configure \
        --prefix=/usr \
        --libdir=/usr/lib \
        --libexecdir=/usr/lib \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        --with-linker-hash-style=gnu \
        --with-system-zlib \
        --enable-__cxa_atexit \
        --enable-cet=auto \
        --enable-checking=release \
        --enable-clocale=gnu \
        --enable-default-pie \
        --enable-default-ssp \
        --enable-gnu-indirect-function \
        --enable-gnu-unique-object \
        --enable-linker-build-id \
        --disable-lto \
        --disable-multilib \
        --disable-plugin \
        --disable-werror \
        --disable-bootstrap \
        --disable-libgomp \
        --disable-libquadmath \
        --disable-libunwind-exceptions \
        --disable-libvtv \
        --disable-libsanitizer \
        --enable-shared \
        --enable-threads=posix \
        --disable-libssp \
        --disable-libstdcxx-pch \
        --enable-languages=c,vhdl

    # Build GHDL
    make

    cd "${srcdir}/ghdl-${pkgver}"

    # Build VHDL libraries and runtime,
    # with some tweaks to enable running GHDL without installing it
    make \
        GHDL_GCC_BIN="${srcdir}/gcc-build/gcc/ghdl" \
        GHDL1_GCC_BIN="--GHDL1=${srcdir}/gcc-build/gcc/ghdl1" \
        ghdllib
}

package() {
    local _xgcc="${srcdir}/gcc-build/gcc/xgcc"
    local _machine=$(${_xgcc} -dumpmachine)
    local _version=$(${_xgcc} -dumpversion)

    # Install GHDL
    cd "${srcdir}/gcc-build"
    make DESTDIR="${pkgdir}" install

    # Install VHDL libraries and runtime
    cd "${srcdir}/ghdl-${pkgver}"
    make DESTDIR="${pkgdir}" install

    # Remove gcc-specific files, keep only what is related to ghdl
    cd "${pkgdir}"
    rm -rf "usr/include/libiberty"
    rm -rf "usr/share/locale"
    rm -rf "usr/share/man/man7"
    find "usr/share/man/man1" \
        -maxdepth 1 -mindepth 1 -not -name 'ghdl*' \
        -exec rm -rf {} +
    find "usr/lib" \
        -maxdepth 1 -mindepth 1 \
        -not -name 'gcc' \
        -not -name '*ghdl*' \
        -exec rm -rf {} +
    find "usr/lib/gcc/${_machine}/${_version}" \
        -maxdepth 1 -mindepth 1 -not -name 'ghdl*' \
        -exec rm -rf {} +
    find "usr/bin" "usr/share/info" \
        -maxdepth 1 -mindepth 1 -not -name 'ghdl*' \
        -exec rm -rf {} +

    # In case it does not exist, create symlink libghdl.so
    local _gso=`ls "${pkgdir}/usr/lib/" | grep -e '^libghdl-.*\.so$' | head -n 1`
    if [[ -n "$_gso" ]] ; then
        ln -s "$_gso" "${pkgdir}/usr/lib/libghdl.so"
    fi
}
