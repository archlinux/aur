# Maintainer: mak1 <kmai@riseup.net>
# Contributor: c0repwn3r <core@coredoes.dev>
# Contributor: Andrew Chen <xor.tux@gmail.com>
pkgname=i686-elf-gcc
pkgver=15.2.0
pkgrel=3
pkgdesc="GNU gcc for the i686 toolchain"
arch=('x86_64')
url="https://www.gnu.org/software/gcc"
license=('GPL')
groups=(i686-elf-toolchain)
makedepends=(gmp mpfr gcc)
depends=(xz libmpc i686-elf-binutils)
source=(
    "http://ftpmirror.gnu.org/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz"
)
sha256sums=(
		438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e
)

build() {

    # Create temporary build dir
    mkdir -p "i686-gcc-$pkgver-build"
    cd "i686-gcc-$pkgver-build"
    # Configure, we are building in seperate directory to cleanly seperate the binaries from the source

		export CFLAGS="${CFLAGS} -Wno-error=format-security -Wformat-security"
  	export CXXFLAGS="${CXXFLAGS} -Wno-error=format-security -Wformat-security"
    ../gcc-$pkgver/configure \
	--prefix=/usr \
	--target=i686-elf \
	--disable-nls \
	--disable-werror \
	--disable-multilib \
	--without-headers \
	--enable-languages=c,c++ \
	--disable-build-format-warnings # https://bugs.archlinux.org/task/70701

    # Build
    make all-gcc
    make all-target-libgcc
}

package() {
    cd "i686-gcc-$pkgver-build"
    make install-gcc DESTDIR=$pkgdir
    make install-target-libgcc DESTDIR=$pkgdir
    # Remove conflicting files
    rm -rf $pkgdir/usr/share/info
    rm -rf $pkgdir/usr/share/man/man7
}

