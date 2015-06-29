# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: xduugu

pkgname=tuxcmd-modules-git
pkgver=0.6.74.r10.gbc2840a
pkgrel=1
pkgdesc='Modules for Tux Commander - git checkout'
arch=('i686' 'x86_64')
url='http://tuxcmd.sourceforge.net/'
license=('GPL')
depends=('tuxcmd')
makedepends=('git' 'sharutils')
optdepends=('gvfs: for gvfs module')
provides=('tuxcmd-modules')
conflicts=('tuxcmd-modules')
options=('!docs' '!emptydirs')
source=('git://git.bzatek.net/tuxcmd-modules/')
sha256sums=('SKIP')

pkgver() {
	cd tuxcmd-modules/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

prepare() {
	cd tuxcmd-modules/

	# fix Makefiles
	for MAKEFILE in $(find -name Makefile); do
		sed -i 's|$(INSTALL) \(.*\) $(DESTDIR)/lib$(LIB_SUFFIX)/tuxcmd/|$(INSTALL) -D \1 $(DESTDIR)/lib/tuxcmd/\1|' ${MAKEFILE}
	done
}

build() {
	cd tuxcmd-modules/

	make -j1
}

package() {
	cd tuxcmd-modules/

	make DESTDIR="${pkgdir}/usr" install
}

