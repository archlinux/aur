# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=openvpn-radiusplugin-git
pkgver=2.2.r1.g79d9869
pkgrel=1
pkgdesc='Radiusplugin for OpenVPN - git checkout'
url='https://github.com/ValdikSS/openvpn-radiusplugin'
arch=('i686' 'x86_64')
depends=('libgcrypt' 'openvpn')
makedepends=('git')
conflicts=('openvpn-radiusplugin')
provides=('openvpn-radiusplugin')
source=("git://github.com/ValdikSS/openvpn-radiusplugin.git")
sha256sums=('SKIP')

pkgver() {
	cd openvpn-radiusplugin/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

build() {
	cd openvpn-radiusplugin/

	make
}

package() {
	cd openvpn-radiusplugin/

	install -Dm0755 radiusplugin.so "${pkgdir}"/usr/lib/openvpn/plugins/radiusplugin.so
	install -Dm0644 radiusplugin.cnf "${pkgdir}"/usr/share/openvpn/examples/radiusplugin.cnf
}
