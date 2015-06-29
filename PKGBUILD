# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: tobias <tobias at archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-clipman-plugin-git
pkgver=1.2.3.r86.g130aa64
pkgrel=1
pkgdesc='A clipboard plugin for the Xfce4 panel - git checkout'
arch=('i686' 'x86_64')
license=('GPL')
url='http://goodies.xfce.org/projects/panel-plugins/xfce4-clipman-plugin'
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libunique' 'libxtst' 'qrencode')
conflicts=('xfce4-clipman-plugin')
provides=('xfce4-clipman-plugin')
makedepends=('xfce4-dev-tools' 'intltool' 'git')
options=('!libtool')
install=xfce4-clipman-plugin.install
source=('git://git.xfce.org/panel-plugins/xfce4-clipman-plugin')
sha256sums=('SKIP')

pkgver() {
	cd xfce4-clipman-plugin/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}


build() {
	cd xfce4-clipman-plugin/

	./autogen.sh
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--disable-static \
		--enable-unique \
		--enable-maintainer-mode \
		--disable-debug
	make
}

package() {
	cd xfce4-clipman-plugin/

	make DESTDIR="${pkgdir}" install
}

