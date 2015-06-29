# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-vpnc-git
pkgver=0.9.8.0.r49.g8a5bacf
pkgrel=1
pkgdesc='NetworkManager VPN plugin for vpnc - git checkout'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.gnome.org/projects/NetworkManager/'
depends=('libnm-gtk' 'vpnc' 'hicolor-icon-theme' 'gtk3' 'libsecret')
makedepends=('git' 'intltool')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
conflicts=('networkmanager-vpnc')
provides=('networkmanager-vpnc')
install=networkmanager-vpnc.install
source=('git://git.gnome.org/network-manager-vpnc')
sha256sums=('SKIP')

pkgver() {
	cd network-manager-vpnc/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd network-manager-vpnc/

	./autogen.sh
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--libexecdir=/usr/lib/networkmanager \
		--enable-more-warnings=yes \
		--disable-static
	make
}

package() {
	cd network-manager-vpnc/

	make DESTDIR="${pkgdir}" install
}
