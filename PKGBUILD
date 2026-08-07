# Maintainer: Dani Rodríguez <dani@danirod.es>
# Contributor: c0repwn3r <core@coredoes.dev>
pkgname=i386-elf-gcc
pkgver=16.2.0
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
sha512sums=('c51c30ca7422d0cbecf504b2e0f33c3aca31e0f90a76b65217f465163fa6fa17b3f5de39e145c47e5bab90ac0ce7fff3b03c8d553ae36e01faaea5a50f8648d1')

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
