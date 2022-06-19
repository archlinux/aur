# Maintainer: Huayu ZHANG <zhanghuayu1233@gmail.com>

pkgname=i686-elf-gdb-git
pkgver=dev
pkgrel=1
pkgdesc="GNU debugger crosscompiled for i686 development (development version)"
arch=(x86_64)
url="https://www.gnu.org/software/gdb"
license=('GPL')
groups=(i686-elf-toolchain-git)
makedepends=(gmp mpfr)
depends=(xz libmpc i686-elf-gcc gdb) # GDB is included to prevent conflicts with it - otherwise this package won't function
#depends=(xz libmpc i686-elf-binutils-git i686-elf-gcc-git gdb)
replaces=(i686-elf-gdb)
conflicts=(i686-elf-gdb)
source=("git+https://sourceware.org/git/binutils-gdb.git")
sha256sums=("SKIP")
OPTIONS=(!strip)

build() {
    #mkdir -p "i686-gdb-build"
    cd "binutils-gdb"
    # Configure, we are building in seperate directory to cleanly seperate the binaries from the source
    ./configure --target=i686-elf --prefix=/usr --program-prefix=i686-elf- \
	    --disable-binutils

    # Build
    make -j$(nproc)
}

package() { 
    cd "binutils-gdb"
    make install DESTDIR=$pkgdir
    # Remove conflicting files
    rm -rf $pkgdir/usr/share/locale/
    rm -rf $pkgdir/usr/share/gdb
    rm -rf $pkgdir/usr/include/gdb
    rm -rf $pkgdir/usr/share/info/dir
    rm -rf $pkgdir/usr/share/info/
    rm -rf $pkgdir/usr/include/sim/callback.h
    rm -rf $pkgdir/usr/include/sim/sim.h
}
