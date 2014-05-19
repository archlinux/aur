pkgname=stund
pkgver=0.96
pkgrel=0
pkgdesc="STUN Server and Client"
url="http://downloads.sourceforge.net/project/stun/stun/"
source=("http://downloads.sourceforge.net/project/stun/stun/0.96/stund_0.96_Aug13.tgz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fstun%2F&ts=1299326697&use_mirror=puzzle")
makedepends=()
optdepends=()

arch=('x86_64' 'i686')
license=('GPL2')
md5sums=('3273abb1a6f299f4e611b658304faefa')

build() {
	cd $srcdir/$pkgname

        if [ `uname -m` = 'x86_64' ]
        then echo '@DPATCH@' >> fix_non_i386.patch 
        echo 'diff -urNad stun-0.96~/stun.cxx stun-0.96/stun.cxx' >> fix_non_i386.patch 
        echo '--- stun-0.96~/stun.cxx	2005-08-14 00:39:03.000000000 +0000' >> fix_non_i386.patch 
        echo '+++ stun-0.96/stun.cxx	2006-01-03 00:54:33.000000000 +0000' >> fix_non_i386.patch 
        echo '@@ -669,16 +669,8 @@' >> fix_non_i386.patch 
        echo '       tick = hightick;' >> fix_non_i386.patch 
        echo '       tick <<= 32;' >> fix_non_i386.patch 
        echo '       tick |= lowtick;' >> fix_non_i386.patch 
        echo '-#elif defined(__GNUC__) && ( defined(__i686__) || defined(__i386__) )' >> fix_non_i386.patch 
        echo '-      asm("rdtsc" : "=A" (tick));' >> fix_non_i386.patch 
        echo '-#elif defined (__SUNPRO_CC) || defined( __sparc__ )	' >> fix_non_i386.patch 
        echo '-      tick = gethrtime();' >> fix_non_i386.patch 
        echo '-#elif defined(__MACH__) ' >> fix_non_i386.patch 
        echo '-      int fd=open("/dev/random",O_RDONLY);' >> fix_non_i386.patch 
        echo '-      read(fd,&tick,sizeof(tick));' >> fix_non_i386.patch 
        echo '-      closesocket(fd);' >> fix_non_i386.patch 
        echo ' #else' >> fix_non_i386.patch 
        echo '-#     error Need some way to seed the random number generator ' >> fix_non_i386.patch 
        echo '+      tick = time(NULL);' >> fix_non_i386.patch 
        echo ' #endif ' >> fix_non_i386.patch 
        echo '       int seed = int(tick);' >> fix_non_i386.patch 
        echo ' #ifdef WIN32' >> fix_non_i386.patch 
        patch --strip 1 < fix_non_i386.patch
        fi

	make all || return 1
	mkdir $pkgdir/usr/bin -p
	cp server $pkgdir/usr/bin/stund || return 1
	cp client $pkgdir/usr/bin/stunc || return 1
}
