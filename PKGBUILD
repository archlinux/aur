# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>
# Contributor: Wijnand Modderman-Lenstra <maze@pyth0n.org>
# Contributor: Vitaliy Berdinskikh <ur6lad@archlinux.org.ua>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=hamlib4
_pkgname=hamlib
__pkgname=Hamlib
pkgver=4.5.2
pkgrel=1
pkgdesc="Ham radio equipment control libraries - VERSION 4.x"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://hamlib.org"
license=('GPL' 'LGPL')
depends=('perl' 'python' 'tcl' 'lua' 'libxml2' 'libindi' \
	'libusb-compat' 'boost')
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config' 'swig')
provides=('hamlib')
conflicts=('hamlib' 'hamlib-git')
source=("https://github.com/$__pkgname/$__pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
options=('!emptydirs')


build() {
	export PYTHON=/usr/bin/python3

	cd $srcdir/$_pkgname-$pkgver

#	./autogen.sh \
	autoreconf -i
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--with-perl-binding \
		--with-python-binding \
		--with-tcl-binding \
		--with-lua-binding \
		--with-xml-support \
		--with-indi-support
	make
}

package() {
	cd $srcdir/$_pkgname-$pkgver

	make DESTDIR=$pkgdir install

	# fix perl module location
#	cd $pkgdir/usr/lib/perl5/site_perl/
	eval $(perl -V:sitearch)
	cd $pkgdir$sitearch
	mkdir -p current/
	mv auto current
	mv Hamlib.pm current
	rm perltest.pl

	/usr/bin/find $pkgdir -name '.packlist' -delete
	/usr/bin/find $pkgdir -name '*.pod' -delete
}
md5sums=('a413d22ecfa5e953dd2178020cb2d6fc')
sha256sums=('5a0f9e932ffe2d3971e07b544aa62bec3e494e73ff1ce3ca33fa0d88e199b061')
