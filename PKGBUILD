# Maintainer: Huayu ZHANG <zhanghuayu1233@gmail.com>
pkgname=i686-elf-gcc-git
pkgver=dev
pkgrel=1
pkgdesc="GNU gcc for the i686- toolchain development build"
arch=(x86_64)
url="https://www.gnu.org/software/gcc"
license=('GPL')
groups=(i686-elf-toolchain-git)
makedepends=(gmp mpfr gcc)
depends=(xz libmpc i686-elf-binutils-git)
source=(
    "git+https://gcc.gnu.org/git/gcc.git"
)
sha256sums=("SKIP")

build() {
    # Create temporary build dir
    # mkdir -p "i686-gcc-build"
    cd "gcc"
    # Configure, we are building in seperate directory to cleanly seperate the binaries from the source
    ./configure \
	--prefix=/usr \
	--target=i686-elf \
	--disable-nls \
	--disable-werror \
	--disable-multilib \
	--without-headers \
	--enable-languages=c,c++ \
	--disable-build-format-warnings # https://bugs.archlinux.org/task/70701

    # Build
    make -j$(nproc) all-gcc
    make -j$(nproc) all-target-libgcc
}

package() {
    cd "gcc"
    make install-gcc DESTDIR=$pkgdir
    make install-target-libgcc DESTDIR=$pkgdir
    # Remove conflicting files
    rm -rf $pkgdir/usr/share/info
    rm -rf $pkgdir/usr/share/man/man7
}

