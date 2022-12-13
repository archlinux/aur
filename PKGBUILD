# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>
# Contributor: Wijnand Modderman-Lenstra <maze@pyth0n.org>
# Contributor: Vitaliy Berdinskikh <ur6lad@archlinux.org.ua>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=hamlib4
_pkgname=hamlib
__pkgname=Hamlib
pkgver=4.5
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
md5sums=('7d9cc9d043691c268f2ccb0f6befb54d')
sha256sums=('14a2ce76a647a75e71d8ccf1f16999a6708e84823d9f74137f2173fcee94ad52')
