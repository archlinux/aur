# Maintainer: Luciano Ciccariello <xeeynamo@hotmail.com>

pkgname=gcc-mipsel-linux-gnu
pkgver=15.1.0
pkgrel=1
pkgdesc="The GNU Compiler Collection for the MIPS architecture"
arch=('x86_64')
url="https://www.gnu.org/software/gcc/"
license=('GFDL-1.3-or-later' 'GPL-3.0-with-GCC-exception')
depends=('binutils-mipsel-linux-gnu')
conflicts=('cross-mipsel-linux-gnu-gcc')
provides=('gcc-mipsel-linux-gnu')
source=("gcc-$pkgver.tar.xz::https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz")
sha256sums=('e2b09ec21660f01fecffb715e0120265216943f038d0e48a9868713e54f06cea')

build() {
    cd "gcc-$pkgver"

    CXXFLAGS="-Wno-error=format-security" ./configure \
        --prefix=/usr \
        --target=mipsel-linux-gnu \
        --enable-languages=c,c++ \
        --disable-nls \
        --disable-threads \
        --disable-libada \
        --disable-libssp \
        --disable-libstdcxx \
        --disable-multilib \
        --disable-libgcj \
        --disable-werror \
        --enable-lto \
        --with-float=soft \
        --with-gnu-as \
        --with-gnu-ld

    make all-gcc "inhibit_libc=true" -j$(nproc)
}

package() {
    cd "gcc-$pkgver"

    make DESTDIR="$pkgdir" install-gcc

    find "$pkgdir" -name '*.la' -delete
    find "$pkgdir" -type f -executable -exec strip --strip-unneeded {} + 2>/dev/null || true
    rm -rf $pkgdir/usr/share
}
