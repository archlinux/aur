# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
# Contributor: Vitaliy Berdinskikh <ur6lad@archlinux.org.ua>

pkgname=hamlib
pkgver=3.2
pkgrel=1
pkgdesc="Ham radio equipment control libraries"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://hamlib.org"
license=('GPL' 'LGPL')
depends=('perl' 'python' 'tcl' 'libxml2' 'libusb-compat' 'libtool')
makedepends=('libtool' 'swig' 'pkgconfig')
source=(
    "http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
)
options=('!emptydirs')
sha1sums=('ee90d0a79c4408b452ea328620c333d650b41f44')
sha256sums=('b55cb5e6a8e876cceb86590c594ea5a6eb5dff2e30fc13ce053b46baa6d7ad1d')

build() {
	cd $srcdir
	cd $pkgname-$pkgver

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--with-perl-binding \
		--with-python-binding \
		--with-tcl-binding

	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR=$pkgdir install

	# fix perl module location
	eval $(perl -V:sitearch)
	cd $pkgdir$sitearch
	mkdir current/
	mv auto current
	mv Hamlib.pm current
	rm perltest.pl

	/usr/bin/find $pkgdir -name '.packlist' -delete
	/usr/bin/find $pkgdir -name '*.pod' -delete
}
