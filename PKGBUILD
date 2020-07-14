# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=libetpan-fdik-git
pkgver=1.6
pkgrel=1
pkgdesc='A portable middleware for email access - fork with some patches'
arch=('i686' 'x86_64')
url='http://www.etpan.org/libetpan.html'
license=('custom:etpan')
depends=('libsasl' 'curl' 'expat')
makedepends=('git' 'libtool' 'autoconf' 'automake' 'make')
provides=('libetpan')
conflicts=('libetpan' 'libetpan-git')
source=('git://github.com/fdik/libetpan.git')
sha256sums=('SKIP')

pkgver() {
	cd libetpan/

	git tag | sort -r | head -1
}

build() {
	cd libetpan/

	# generate automake files that are not included in the tarball
	libtoolize --force --copy
	aclocal -I m4
	autoheader
	autoconf
	automake --add-missing --foreign --force --copy
	#autoreconf -vfi

	./configure --prefix=/usr \
		--disable-static \
		--disable-db
	make
}

package() {
	cd libetpan/

	make DESTDIR=${pkgdir} install
	install -Dm644 COPYRIGHT ${pkgdir}/usr/share/licenses/libetpan/license.txt
}
