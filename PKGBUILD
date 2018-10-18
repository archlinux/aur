# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
# Contributor: Vitaliy Berdinskikh <ur6lad@archlinux.org.ua>

pkgname=hamlib
pkgver=3.3
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
sha1sums=('a39853bb62f91a16e6b024e809e198ad9cd46417')
sha256sums=('c90b53949c767f049733b442cd6e0a48648b55d99d4df5ef3f852d985f45e880')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--with-perl-binding \
		--with-python-binding \
		--with-tcl-binding

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	# fix perl module location
	eval $(perl -V:sitearch)
	cd "$pkgdir/$sitearch"
	mkdir current/
	mv auto current
	mv Hamlib.pm current
	rm perltest.pl

	/usr/bin/find "$pkgdir" -name '.packlist' -delete
	/usr/bin/find "$pkgdir" -name '*.pod' -delete
}
