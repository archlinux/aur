# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# Contributor: Daniel Hillenbrand < codeworkx at bbqlinux dot org >
# Maintainer: Liao Junxuan <mikeljx at 126 dot com>

pkgname=mipsel-elf-binutils
_pkgname=binutils
_target="mipsel-elf"
pkgver=2.42
pkgrel=1
pkgdesc="A collection of binary tools for baremetal MIPS."
url="http://www.gnu.org/software/binutils/"
arch=('x86_64')
license=('GPL-3.0-or-later AND GFDL-1.3-no-invariants-or-later AND FSFAP')
checkdepends=(dejagnu debuginfod bc)
depends=(glibc zstd libelf)
source=("https://ftp.gnu.org/gnu/binutils/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('f6e4d41fd5fc778b06b7891457b3620da5ecea1006c6a4a41ae998109f85a800')
_sysroot="/usr/lib/${_target}"

prepare() {
    cd ""$srcdir""/${_pkgname}-${pkgver}

    # Hack - see native package for details
    sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
    cd ""$srcdir""/${_pkgname}-${pkgver}

    mkdir -p binutils-build && cd binutils-build

    # Extract the FSF All Permissive License
    # <https://www.gnu.org/prep/maintain/html_node/License-Notices-for-Other-Files.html>
    # used for some linker scripts.
    tail -n 5 ../ld/scripttempl/README >FSFAP

    ../configure \
        --prefix=${_sysroot} \
        --infodir=/usr/share/info/${_target} \
        --bindir=/usr/bin \
        --target="${_target}" --build="$CHOST" --host="$CHOST" \
        --disable-werror \
        --disable-nls \
        --with-gcc --with-gnu-as --with-gnu-ld \
        --without-included-gettext \
        --disable-win32-registry

    make
}

check() {
    cd ""$srcdir""/${_pkgname}-${pkgver}
    cd binutils-build

    # From binutils:
    # Use minimal flags for testsuite
    # ld testsuite uses CFLAGS_FOR_TARGET and requires -g
    # gold testsuite requires CXXFLAGS/CFLAGS with default PIE/PIC disabled
    make -O CFLAGS_FOR_TARGET="-O2 -g" \
        CXXFLAGS="-O2 -no-pie -fno-PIC" \
        CFLAGS="-O2 -no-pie" \
        LDFLAGS="" \
        check || true
}

package() {
    cd ""$srcdir""/${_pkgname}-${pkgver}
    cd binutils-build

    make DESTDIR="""$pkgdir""" install

    # install FSF All Permissive License
    install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ FSFAP
}
