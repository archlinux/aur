# Mainainer: Christian Hesse <mail@eworm.de>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=file-git
pkgver=5.21.r4.g4f2c3a6
pkgrel=1
pkgdesc='File type identification utility - git checkout'
arch=('i686' 'x86_64')
license=('custom')
groups=('base' 'base-devel')
url='http://www.darwinsys.com/file/'
depends=('zlib')
makedepends=('git')
provides=('file')
conflicts=('file')
source=('git://github.com/file/file')
sha256sums=('SKIP')

pkgver() {
	cd file/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}


build() {
	cd file/

	autoreconf -fi
	./configure --prefix=/usr --datadir=/usr/share/file
	make
}

package() {
	cd file/

	make DESTDIR="${pkgdir}" install

	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	rmdir "${pkgdir}/usr/share/man/man5"
}

