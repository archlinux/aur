# Maintainer: Huayu ZHANG <zhanghuayu1233@gmail.com>
pkgname=i686-elf-gcc-git
pkgver=12.1.0
pkgrel=1
pkgdesc="GNU gcc for the i686- toolchain development build (newest release build)"
arch=(x86_64)
url="https://www.gnu.org/software/gcc"
license=('GPL')
makedepends=(gmp mpfr gcc)
#depends=(xz libmpc)
depends=(xz libmpc i686-binutils-git)
# https://bugs.archlinux.org/task/70701 (patch modified for gcc 12 and 13)
#source=("git+https://gcc.gnu.org/git/gcc.git" "gcc12-Wno-format-security.patch") 
#sha256sums=("SKIP" "07c72cccb31b5fb035042eca910c9bf0d3008aaeb04350534bb7f5aede209982")
source=("https://ftp.gnu.org/gnu/gcc/gcc-12.1.0/gcc-12.1.0.tar.xz")
sha256sums=("62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b")

build() {
    # patching
    cd "gcc-$pkgver"
	./contrib/download_prerequisites
    # cd "gcc"
    # patch --strip=1 --input="$srcdir/gcc11-Wno-format-security.patch"
    patch --strip=1 --input="$srcdir/gcc12-Wno-format-security.patch"
    cd ..
    # Create temporary build dir
    # mkdir -p "i686-gcc-$pkgver-build"
    # cd "i686-gcc-$pkgver-build"
   
    mkdir -p "i686-gcc-build"
    cd "i686-gcc-build"
    
    # Configure, we are building in seperate directory to cleanly seperate the binaries from the source
	#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/
    #../gcc/configure \
    ../gcc-${pkgver}/configure \
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
    #make distclean
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

