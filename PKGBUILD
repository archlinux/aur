# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn-git
pkgver=1.8.9.dev.r5.g8802a1f
pkgrel=1
pkgdesc='NetworkManager VPN plugin for OpenVPN - git checkout'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.gnome.org/projects/NetworkManager/'
depends=('libnm-gtk' 'openvpn' 'libsecret' 'libnma')
makedepends=('git' 'intltool' 'python')
provides=('networkmanager-openvpn')
conflicts=('networkmanager-openvpn')
source=('git+https://gitlab.gnome.org/GNOME/network-manager-openvpn.git')
sha256sums=('SKIP')

pkgver() {
	cd network-manager-openvpn/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}
build() {
	cd network-manager-openvpn/

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
	cd network-manager-openvpn/

	make DESTDIR="${pkgdir}" install
}

