# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libetpan-git
pkgver=1.4.1.r0.gc2b2d0f
pkgrel=1
pkgdesc='A portable middleware for email access - git checkout'
arch=('i686' 'x86_64')
url='http://www.etpan.org/libetpan.html'
license=('custom:etpan')
depends=('libsasl' 'curl' 'expat')
makedepends=('git')
provides=('libetpan')
conflicts=('libetpan')
source=('git://github.com/dinhviethoa/libetpan.git')
sha256sums=('SKIP')

pkgver() {
	cd libetpan/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
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
