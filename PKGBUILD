# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
# Contributor: Vitaliy Berdinskikh <ur6lad@archlinux.org.ua>

pkgname=hamlib
pkgver=3.0
pkgrel=1
pkgdesc="Ham radio equipment control libraries"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://hamlib.org"
license=('GPL' 'LGPL')
depends=('perl' 'python2' 'tcl' 'libxml2' 'libusb-compat' 'libtool')
makedepends=('libtool' 'swig' 'pkgconfig')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
options=('!emptydirs')
changelog=${pkgname}.ChangeLog.markdown

build() {
	export PYTHON=/usr/bin/python2

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
	cd $pkgdir/usr/lib/perl5/site_perl/
	mkdir current/
	mv auto current
	mv Hamlib.pm current
	rm perltest.pl

	/usr/bin/find $pkgdir -name '.packlist' -delete
	/usr/bin/find $pkgdir -name '*.pod' -delete
}
sha1sums=('d7da25f1d4b48f9e2a90f45a114ae266bb6e8885')
sha256sums=('bc16546161a47e21a44a710a40aeb0bce478f112bffcc4f253eb27e150f1c21e')
