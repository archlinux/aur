# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Zbyszek Tokarczyk <ztokarczyk (at) Gmail.com>

pkgname=xfce4-notifyd-git
pkgver=0.2.4.r63.gdf7c16d
pkgrel=1
pkgdesc='notification daemon for the xfce desktop - git checkout'
arch=('i686' 'x86_64')
license=('GPL')
url='http://goodies.xfce.org/projects/applications/xfce4-notifyd'
groups=('xfce4-goodies')
depends=('libxfce4ui' 'hicolor-icon-theme')
makedepends=('xfce4-dev-tools' 'exo' 'intltool' 'git')
conflicts=('xfce4-notifyd')
provides=('notification-daemon' 'xfce4-notifyd')
options=('!libtool')
install=${pkgname}.install
source=('git://git.xfce.org/apps/xfce4-notifyd')
sha256sums=('SKIP')

pkgver() {
	cd xfce4-notifyd/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd xfce4-notifyd/

	./autogen.sh \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/xfce4 \
		--localstatedir=/var \
		--disable-static
	make
}

package() {
	cd xfce4-notifyd/

	make DESTDIR=${pkgdir} install
}

