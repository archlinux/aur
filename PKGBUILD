# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
# Contributor: Vitaliy Berdinskikh <ur6lad@archlinux.org.ua>

pkgname=hamlib
pkgver=3.1
pkgrel=2
pkgdesc="Ham radio equipment control libraries"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://hamlib.org"
license=('GPL' 'LGPL')
depends=('perl' 'python' 'tcl' 'libxml2' 'libusb-compat' 'libtool')
makedepends=('libtool' 'swig' 'pkgconfig')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
options=('!emptydirs')
sha256sums=('682304c3e88ff6ccfd6a5fc28b33bcc95d2d0a54321973fef015ff62570c994e')
sha512sums=('befc5c407379e30711bde2affb9c191add6dbb04a36c1309f8771170cf04156c48609a094775638036282e085de6c78d09ef8d2760d69c595471e16e985e0885')

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
