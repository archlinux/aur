# Maintainer: batot <archpackager@algrim.pl>
# Contributor: Spider.007 <archPackage@spider007.net>
packager="batot <archpackager@algrim.pl>"
pkgname=netatop
pkgver=3.2.2
pkgrel=2
pkgdesc="Atop network kernel module, enables network statistics in atop"
url="http://www.atoptool.nl/"
groups=('modules')
license=('GPL')
#install='depmod.install'
install='netatop.install'
depends=('atop' 'dkms')
makedepends=('linux-headers')
source=("http://atoptool.nl/download/netatop-$pkgver.tar.gz"
	"netatop.install"
	"netatop-load.hook"
)
sha256sums=('508a8977cd3d1cdd67587a13c25e3a414647b48f92d1ce38fc138b5914aea3f6'
	    'SKIP' 	# netatop.install
	    'SKIP' 	# netatop-load.hook
)
arch=('x86_64' 'i386')

build() {
	cd $srcdir/$pkgname-$pkgver
	make all
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# 1) Copy sources to /usr/src
	install -dm755 "$pkgdir/usr/src/$pkgname-$pkgver"
	#cp -a ./* "$pkgdir/usr/src/$pkgname-$pkgver/"
	install -dm755 "$pkgdir/usr/src/$pkgname-$pkgver"
	install -Dm644 dkms.conf       "$pkgdir/usr/src/$pkgname-$pkgver/dkms.conf"
	install -Dm644 Makefile        "$pkgdir/usr/src/$pkgname-$pkgver/Makefile"
	install -Dm644 netatop.c        "$pkgdir/usr/src/$pkgname-$pkgver/netatop.c"
	install -Dm644 netatop.h        "$pkgdir/usr/src/$pkgname-$pkgver/netatop.h"
	install -Dm644 netatopversion.h "$pkgdir/usr/src/$pkgname-$pkgver/netatopversion.h"
	
	# 2) Install daemon and manpage
	#install -Dm0755 netatopd "$pkgdir/usr/bin/netatopd"
	install -Dm0644 man/netatop.4  "$pkgdir/usr/share/man/man4/netatop.4"
	install -Dm0644 man/netatopd.8 "$pkgdir/usr/share/man/man8/netatopd.8"

	# 3) Installation without DKMS
	#mkdir -p $pkgdir/etc/modules-load.d
	#install -dm755 "$pkgdir/usr/lib/modules-load.d"
	#echo "netatop" > "$pkgdir/usr/lib/modules-load.d/netatop.conf"
	#install -Dm0744 netatop.ko "$pkgdir/usr/lib/modules/$(uname -r)/extramodules/netatop.ko"
	#install -D /$srcdir/$pkgname-$pkgver/netatopd $pkgdir/usr/bin/netatopd
	#echo "add_module netatop/$pkgver" > "$pkgdir/usr/lib/modules-load.d/netatop.conf"	#I'm not sure if it's required.

	# 4) Installation with DKMS
	install -Dm0644 dkms.conf "$pkgdir/usr/src/$pkgname-$pkgver/dkms.conf"
	install -Dm0644 netatop.c "$pkgdir/usr/src/$pkgname-$pkgver/netatop.c"
 	install -Dm0644 netatop.h "$pkgdir/usr/src/$pkgname-$pkgver/netatop.h"
	install -Dm0644 netatopversion.h "$pkgdir/usr/src/$pkgname-$pkgver/netatopversion.h"
	install -Dm644 Makefile "$pkgdir/usr/src/$pkgname-$pkgver/Makefile"
	#echo 'obj-m += netatop.o' > "$pkgdir/usr/src/netatop-$pkgver/Makefile"


	# 5) Autoload modules at boot
	install -Dm644 /dev/null "$pkgdir/usr/lib/modules-load.d/netatop.conf"
	echo "netatop" > "$pkgdir/usr/lib/modules-load.d/netatop.conf"
	# HOOK Pacman
	install -Dm644 "$srcdir/netatop-load.hook" "$pkgdir/usr/share/libalpm/hooks/99-netatop-load.hook"
	
	# 6) If you liked other destination example  /etc/
	#install -dm755 "$pkgdir/etc/modules-load.d"
	#echo "netatop" > "$pkgdir/etc/modules-load.d/netatop.conf"
}

post_install() {
	#dkms install -m netatop -v "$pkgver" --no-depmod
	dkms autoinstall --no-depmod
	depmod -a
	modprobe netatop
}

pre_remove() {
	rmmod netatop || true
	dkms remove -m netatop -v "$pkgver" --all || true
	depmod -a
}

post_upgrade() {
    	dkms install -m netatop -v "$pkgver" --no-depmod
	depmod -a
}

