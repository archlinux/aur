# Maintainer: Huayu ZHANG <zhanghuayu1233@gmail.com>
pkgname=i686-elf-gcc-git
pkgver=12.1.0
pkgrel=1
pkgdesc="GNU gcc for the i686- toolchain development build"
arch=(x86_64)
url="https://www.gnu.org/software/gcc"
license=('GPL')
#groups=(i686-elf-toolchain-git)
makedepends=(gmp mpfr gcc)
depends=(xz libmpc i686-elf-binutils-git)
source=("git+https://gcc.gnu.org/git/gcc.git" "gcc12-Wno-format-security.patch") 
# https://bugs.archlinux.org/task/70701 (patch modified for gcc 12)
sha256sums=("SKIP" "07c72cccb31b5fb035042eca910c9bf0d3008aaeb04350534bb7f5aede209982")


build() {
    # patching
    # cd "gcc-$pkgver"
    cd "gcc"
    # patch --strip=1 --input="$srcdir/gcc11-Wno-format-security.patch"
    patch --strip=1 --input="$srcdir/gcc12-Wno-format-security.patch"
    cd ..
    # Create temporary build dir
    # mkdir -p "i686-gcc-$pkgver-build"
    # cd "i686-gcc-$pkgver-build"
   
    mkdir -p "i686-gcc-build"
    cd "i686-gcc-build"
    
    # Configure, we are building in seperate directory to cleanly seperate the binaries from the source
    ../gcc/configure \
	--prefix=/usr \
	--target=i686-elf \
	--disable-nls \
	--disable-multilib \
	--without-headers \
	--enable-languages=c,c++ \
	--disable-build-format-warnings \
	--disable-werror 

    # Build

    #export CFLAGS="-Wno-error"
    #export CXXFLAGS="-Wno-error"
    make -j$(nproc) all-gcc
    make -j$(nproc) all-target-libgcc
}

package() {
    # cd "i686-gcc-$pkgver-build"
    cd "i686-gcc-build"
    make install-gcc DESTDIR=$pkgdir
    make install-target-libgcc DESTDIR=$pkgdir
    # Remove conflicting files
    rm -rf $pkgdir/usr/share/info
    rm -rf $pkgdir/usr/share/man/man7
}

