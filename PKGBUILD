# Maintainer: Huayu ZHANG <zhanghuayu1233@gmail.com>

pkgname=gdb11
pkgver=11.1
pkgrel=1
pkgdesc="GNU debugger crosscompiled for i686 development (version 11) for compability with clion remote debugging"
arch=(x86_64)
url="https://www.gnu.org/software/gdb"
license=('GPL')
makedepends=(gmp mpfr)
depends=(xz libmpc gdb) # GDB is included to prevent conflicts with it - otherwise this package won't function
replaces=("i686-elf-gdb")
conflicts=("i686-elf-gdb")
source=("https://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz")
sha256sums=("cccfcc407b20d343fb320d4a9a2110776dd3165118ffd41f4b1b162340333f94")
OPTIONS=(!strip)


build() {
	if [-d 'gdb11-build']
	then
		rm -rf gdb11-build
		mkdir gdb11-build
	else
		mkdir gdb11-build
	fi
	if [-d '/opt/gdb11']
	then
		sudo rm -rf /opt/gdb11
		sudo mkdir /opt/gdb11
	else
		sudo mkdir /opt/gdb11
	fi
	
	cd "gdb11-build"
	../gdb-$pkgver/configure --prefix=/opt/gdb11
	
    # Build
    make -j$(nproc)
}

package() { 
	cd "gdb11-build"
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
