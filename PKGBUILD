# Maintainer: Dmytro Bagrii <dimich.dmb@gmail.com>
# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>
# Contributor: Wijnand Modderman-Lenstra <maze@pyth0n.org>
# Contributor: Vitaliy Berdinskikh <ur6lad@archlinux.org.ua>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=hamlib-noindi-git
_pkgname=hamlib-git
pkgver=r9678.fa4a96e6
pkgrel=1
pkgdesc="Hamlib without libindi dependency"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://hamlib.org"
license=('GPL' 'LGPL')
depends=('perl' 'python' 'tcl' 'lua' 'libxml2' 'libusb-compat' 'boost')
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config' 'swig' 'git')
provides=('hamlib' 'hamlib4')
conflicts=('hamlib' 'hamlib4' ${_pkgname})
options=('!emptydirs')
source=('hamlib-git::git+git://git.code.sf.net/p/hamlib/code')


pkgver() {
	cd $srcdir/${_pkgname}

	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	export PYTHON=/usr/bin/python3

	cd $srcdir/${_pkgname}

#	./autogen.sh \
	autoreconf -i
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--with-perl-binding \
		--with-python-binding \
		--with-tcl-binding \
		--with-lua-binding \
		--with-xml-support
	make
}

package() {
	cd $srcdir/${_pkgname}

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
