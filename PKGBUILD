# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=memtest86+-pxe-git
pkgver=0.r22.g96cc317
pkgrel=1
pkgdesc='An advanced memory diagnostic tool as a PXE NBP - git checkout'
arch=('any')
url='http://www.ipxe.org/'
license=('GPL')
makedepends=('git')
provides=('memtest86+-pxe')
conflicts=('memtest86+-pxe')
source=('memtest86-pxe::git://git.ipxe.org/people/mcb30/memtest.git#branch=pxe501')
sha256sums=('SKIP')

pkgver() {
	cd memtest86-pxe/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd memtest86-pxe/

	make CC='gcc -fno-pie' memtest.0
}

package() {
	cd memtest86-pxe/

	install -D -m0755 memtest.0 ${pkgdir}/usr/lib/memtest86+-pxe/memtest.0
}

