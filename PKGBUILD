# Maintainer: Carsten Feuls <archlinux at carstenfeuls dot de>

pkgname=hamlib-git
pkgver=3f1bde0
pkgrel=1
pkgdesc="Ham radio equipment control libraries"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://hamlib.org"
license=('GPL' 'LGPL')
depends=('perl' 'python2' 'tcl' 'libxml2' 'libusb')
makedepends=('libtool' 'swig')
source=('hamlib-git::git+git://git.code.sf.net/p/hamlib/code')
options=('!emptydirs')
conflicts=('hamlib')
provides=('hamlib')
md5sums=('SKIP')
sha256sums=('SKIP')


pkgver() {
	cd ${srcdir}/${pkgname}
	git describe --always | sed 's|-|.|g'
}

build() {
	export PYTHON=/usr/bin/python2

	cd ${srcdir}/${pkgname}
	./autogen.sh \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--with-perl-binding \
		--with-python-binding \
		--with-xml-support \
		--with-tcl-binding
	make
}

package() {
	cd ${srcdir}/${pkgname}

	make DESTDIR=$pkgdir install

	# fix perl module location
	cd $pkgdir/usr/lib/perl5/site_perl/
	mkdir -p current/
	mv auto current
	mv Hamlib.pm current
	rm perltest.pl

	/usr/bin/find $pkgdir -name '.packlist' -delete
	/usr/bin/find $pkgdir -name '*.pod' -delete
}

