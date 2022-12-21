# Maintainer: Huayu ZHANG <zhanghuayu.dev@gmail.com>

pkgname=i686-elf-gcc-aarch64
pkgver=12.2.0
pkgrel=1
pkgdesc="i686-elf-gcc build for host aarch64"
arch=('aarch64')
url="https://gcc.gnu.org/"
license=('GPL')
depends=('xz' 'libmpc' 'i686-elf-binutils-aarch64')
source=("https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.gz")
sha256sums=('ac6b317eb4d25444d87cf29c0d141dedc1323a1833ec9995211b13e1a851261c')

prepare() {
    cd "${srcdir}"

    mkdir build
}

build() {
    cd "${srcdir}/build"

    ../gcc-${pkgver}/configure --target=i686-elf \
        --disable-nls \
        --without-isl \
        --without-headers \
        --with-as=/usr/local/bin/i686-elf-as \
        --with-ld=/usr/local/bin/i686-elf-ld \
        --enable-languages=c,c++ \
        --disable-werror


    # edit /etc/makepkg.conf `MAKEFLAG` to speed up build
    make all-gcc

    make all-target-libgcc

}

package() {
    cd "${srcdir}/build"

    make DESTDIR="${pkgdir}" install-gcc

    make DESTDIR="${pkgdir}" install-target-libgcc

    cd "${pkgdir}/usr/local/share"

    rm -rf info
    rm -rf man
}
