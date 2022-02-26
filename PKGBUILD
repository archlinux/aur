# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>
# Contributor: Wijnand Modderman-Lenstra <maze@pyth0n.org>
# Contributor: Vitaliy Berdinskikh <ur6lad@archlinux.org.ua>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=hamlib-git
pkgver=r8655.d04f4b6b
pkgrel=2
pkgdesc="Ham radio equipment control libraries - GIT VERSION 4.x"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://hamlib.org"
license=('GPL' 'LGPL')
depends=('perl' 'python' 'tcl' 'lua' 'libxml2' 'libindi' \
	'libusb-compat' 'boost')
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config' 'swig')
provides=('hamlib4')
conflicts=('hamlib' 'hamlib4')
source=('hamlib-git::git+git://git.code.sf.net/p/hamlib/code')
options=('!emptydirs')


pkgver() {
	cd $srcdir/$pkgname

	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	export PYTHON=/usr/bin/python3

	cd $srcdir/$pkgname

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
	cd $srcdir/$pkgname

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
md5sums=('SKIP')
sha256sums=('SKIP')
