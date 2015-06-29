# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: xduugu

pkgname=tuxcmd-git
pkgver=0.6.78.r5.ged0d989
pkgrel=1
pkgdesc='A GTK2 file manager with two panels - git checkout'
arch=('i686' 'x86_64')
url='http://tuxcmd.sourceforge.net/'
license=('GPL')
depends=('gtk2')
makedepends=('fpc' 'git')
optdepends=('gnome-vfs')
provides=('tuxcmd')
conflicts=('tuxcmd')
options=('!docs' '!emptydirs')
source=('git://git.bzatek.net/tuxcmd/'
	'tuxcmd.desktop')
sha256sums=('SKIP'
            '729d0ed4de75213f356fa56ef081b03b1c27c1f5cc697eb92d2de43c1e3ba73c')

pkgver() {
	cd tuxcmd/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd tuxcmd/

	make
}

package() {
	cd tuxcmd/

	# Note we need usr/ in DESTDIR, the package does not deal with a prefix.
	make DESTDIR="${pkgdir}/usr/" install

	install -m0644 -D "${srcdir}/tuxcmd.desktop" "${pkgdir}/usr/share/applications/tuxcmd.desktop"
}

