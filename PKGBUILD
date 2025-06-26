# Maintainer: Jacko Dirks <jacko dot dirks at gmail dot com>
# Contributor: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=ghdl-gcc
pkgver=5.1.1
pkgrel=1
arch=('x86_64')
pkgdesc='VHDL simulator - GCC back-end'
url='https://github.com/ghdl/ghdl'
license=('GPL-2.0-only')

_gccver=13.3.0

provides=("ghdl=${pkgver}")
conflicts=('ghdl' 'ghdl-git')
makedepends=('gmp' 'mpfr' 'gcc-ada' 'libisl' 'libmpc' 'zstd')
checkdepends=('python-pytest' 'python-pytooling>=8.0.0')
depends=('libmpc' 'zstd' 'libisl' "gcc-libs>=$_gccver")
options=(!emptydirs !lto)

source=(
    ghdl-${pkgver}.tar.gz::https://github.com/ghdl/ghdl/archive/refs/tags/v${pkgver}.tar.gz
    https://gcc.gnu.org/pub/gcc/releases/gcc-${_gccver}/gcc-${_gccver}.tar.xz{,.sig}
)
sha512sums=(
    'b70051d49b5f4e427b116512ef29589b826308de1b33f2c4f8fd49c50eaeaf6e09be454c8455665b59f8f7b5cb82c9c198a1c29ebf8ca1110e7126f3e10f5567'
    'ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801'
    '71674d2ce646a01913a04a400c198c57adc38bf2fc0165424db0c0d13a5cd780bf6a2cc393edc3ae179f98640e7e7f8865b4880a6d55434dc9a6f6d3f183d420'
)

validpgpkeys=(33C235A34C46AA3FFB293709A328C3A2C3C45C06  # Jakub Jelinek <jakub@redhat.com>
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # Jakub Jelinek <jakub@redhat.com>
              13975A70E63C361C73AE69EF6EEB81F8981C74C7) # Richard Guenther <richard.guenther@gmail.com>

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
