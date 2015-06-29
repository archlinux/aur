# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Jason Hall <cakersq@gmail.com>

pkgname=thin-provisioning-tools-git
pkgver=0.4.0.r0.g39990e6
pkgrel=1
pkgdesc='A suite of tools for manipulating the metadata of the dm-thin device-mapper target - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/jthornber/thin-provisioning-tools'
license=('GPL3')
depends=('expat' 'gcc-libs')
makedepends=('boost' 'git')
provides=('thin-provisioning-tools')
conflicts=('thin-provisioning-tools')
source=('git://github.com/jthornber/thin-provisioning-tools.git')
sha256sums=('SKIP')

pkgver() {
	cd thin-provisioning-tools/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd thin-provisioning-tools/

	autoconf
	./configure --prefix=/usr
	make
}

package() {
	cd thin-provisioning-tools/

	make DESTDIR="${pkgdir}" BINDIR="${pkgdir}"/usr/bin MANDIR=/usr/share/man install
}

