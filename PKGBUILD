# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# Contributor: Shengqi Chen <i at harrychen dot xyz>
# Maintainer: Liao Junxuan <mikeljx at 126 dot com>

pkgname=mipsel-elf-gcc
_pkgname=gcc
_target="mipsel-elf"
pkgver=12.2.0
pkgrel=1
pkgdesc="The GNU Compiler Collection - C and C++ frontends (for baremetal MIPS)"
url="https://www.gnu.org/software/gcc/"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=("${_target}-binutils")
makedepends=("gcc-ada>=${pkgver:0:2}")
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=("https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff')

prepare() {
    cd "$srcdir"/${_pkgname}-${pkgver}

    # Hack - see native package for details
    sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
}

build() {
    CFLAGS=${CFLAGS/-Werror=format-security/}
    CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

    cd "$srcdir"/${_pkgname}-${pkgver}
    mkdir -p gcc-build && cd gcc-build
    ../configure \
        --prefix=/usr --libexecdir=/usr/lib \
        --target="${_target}" \
        --with-newlib \
        --with-gnu-as --with-gnu-ld \
        --disable-nls \
        --disable-decimal-float \
        --disable-threads \
        --disable-libatomic \
        --disable-libgomp \
        --disable-libquadmath \
        --disable-libssp \
        --disable-libvtv \
        --disable-libstdcxx \
        --enable-languages=c,c++ \
        --disable-multilib --disable-libgcj \
        --enable-lto --disable-werror \
        --without-headers --disable-shared \
        --enable-initfini-array
    make
}

package() {
    cd "$srcdir"/${_pkgname}-${pkgver}
    cd gcc-build
    make DESTDIR="$pkgdir" install
    

    find "$pkgdir"/usr/lib/gcc/$_target/ \
       -type f -and \( -name \*.a -or -name \*.o \) \
       -exec "${_target}"-strip '{}' \;

    find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/ \
        -type f -and \( -executable \) -exec strip '{}' \;

    # remove the documentation
    rm -rf "$pkgdir"/usr/share
    # remove unnecessary files
    rm "$pkgdir"/usr/lib/libcc1.*
}
