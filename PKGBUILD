# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xfmpc-git
pkgver=0.2.2.r93.gde0a987
pkgrel=1
pkgdesc="A graphical GTK+ MPD client focusing on low footprint - git checkout"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/xfmpc/"
license=('GPL')
provides=('xfmpc')
conflicts=('xfmpc')
depends=('libxfce4ui' 'libmpd')
makedepends=('intltool' 'vala')
source=('git://git.xfce.org/apps/xfmpc')
sha256sums=('SKIP')

pkgver() {
	cd xfmpc/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd xfmpc/

	sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.in.in
	sed -i 's/CHARSET/UTF-8/' po/sl.po
	sed -i 's/Timeout.add/Gtk.Timeout.add/' src/main-window.vala
	./autogen.sh --prefix=/usr
	# building fails with parallel processes... so we unset MAKEFLAGS and do
	# not use -j5...
	MAKEFLAGS="" make
}

package() {
	cd xfmpc/

	make DESTDIR="${pkgdir}" install
}

