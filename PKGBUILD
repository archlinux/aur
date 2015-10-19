# Maintainer: Spider.007 <archPackage@spider007.net>
# Contributor: Spider.007 <archPackage@spider007.net>
packager="Spider.007 <archPackage@spider007.net>"
pkgname=netatop
pkgver=0.7
pkgrel=1
pkgdesc="Atop network kernel module, enables network statistics in atop"
url="http://www.atoptool.nl/"
groups=modules
license='GPL'
install='depmod.install'
depends=('atop')
makedepends=('linux-headers')
source=("http://atoptool.nl/download/netatop-$pkgver.tar.gz")
sha256sums=('d4c5a5d27e38b5a5b54b8e0dc73e6b6f75e8dea9b9279397e6f558a8e9a66987')
arch=('x86_64' 'i386')

build() {
	cd $srcdir/$pkgname-$pkgver

	make all
}

package() {
	cd $srcdir/$pkgname-$pkgver

	if [[ `uname -r` =~ ^([0-9.]+)\.[0-9]+-[0-9]+(-.*)$ ]]
	then
		install -Dm 0744 module/netatop.ko $pkgdir/usr/lib/modules/extramodules-${BASH_REMATCH[1]}${BASH_REMATCH[2]}/netatop.ko
	else
		echo "Could not parse version `uname -r`; please report" >&2
		exit 1
	fi

	install -D daemon/netatopd $pkgdir/usr/bin/netatopd

	install -D man/netatop.4 $pkgdir/usr/share/man/man4/netatop.4
	install -D man/netatopd.8 $pkgdir/usr/share/man/man8/netatopd.8

	mkdir -p $pkgdir/etc/modules-load.d

	echo "netatop" > $pkgdir/etc/modules-load.d/netatop.conf
}
