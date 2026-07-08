# Maintainer: Dani Rodríguez <dani@danirod.es>
# Contributor: c0repwn3r <core@coredoes.dev>
pkgname=i386-elf-gcc
pkgver=16.1.0
pkgrel=1
epoch=
pkgdesc="GNU gcc for the i386- toolchain"
arch=(x86_64)
url="https://www.gnu.org/software/gcc"
license=('GPL')
groups=(i386-elf-toolchain)
makedepends=(gmp mpfr gcc)
depends=(xz libmpc i386-elf-binutils)
source=(
    "http://ftpmirror.gnu.org/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz"
)
sha512sums=('b3454958891ab47e1e5b6cb9396c0ad3b04f32fe2a7bf1153a143f21013fdb6b295ca94c98964698a688e4c1d7555ffd8ffbc20187507cce6b1c32cbcc09897a')

build() {
    # GCC build fails with format-security.
    CFLAGS=${CFLAGS/-Werror=format-security/}
    CXXFLAGS=${CXXFLAGS/-Werror=format-security/}
    # Create temporary build dir
    mkdir -p "i386-gcc-$pkgver-build"
    cd "i386-gcc-$pkgver-build"
    # Configure, we are building in seperate directory to cleanly seperate the binaries from the source
    ../gcc-$pkgver/configure \
	--prefix=/usr \
	--target=i386-elf \
	--disable-nls \
	--disable-werror \
	--disable-multilib \
	--without-headers \
	--enable-languages=c,c++ \
	--disable-werror

    # Build
    make all-gcc
    make all-target-libgcc
}

check() {
    cd "i386-gcc-$pkgver-build"
    make -k check-gcc
}

package() {
    cd "i386-gcc-$pkgver-build"
    make install-gcc DESTDIR=$pkgdir
    make install-target-libgcc DESTDIR=$pkgdir
    # Remove conflicting files
    rm -rf $pkgdir/usr/share/info
    rm -rf $pkgdir/usr/share/man/man7
}
