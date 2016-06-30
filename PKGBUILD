# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=wireguard-git
pkgname=(wireguard-dkms-git wireguard-tools-git)
pkgver=0.0.20160630.r1.g9a052f6
pkgrel=2
pkgdesc='next generation secure network tunnel - git checkout'
arch=('x86_64' 'i686')
url='http://www.wireguard.io/'
license=('GPL')
makedepends=('git' 'libmnl')
source=('git+https://git.zx2c4.com/WireGuard'
	'dkms.conf')
sha256sums=('SKIP'
            'f34dced05d2b1d9713da12eeef02e71db213646a4c8f6852227430bd84127433')

pkgver() {
	cd WireGuard/

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
	cd WireGuard/src/tools/

	make
}

package_wireguard-dkms-git() {
	depends=('dkms')
	provides=('wireguard-dkms')
	conflicts=('wireguard-dkms')

	cd WireGuard/src/

	install -d -m0755 "${pkgdir}"/usr/src/wireguard-${pkgver}/crypto/
	install -D -m0755 "${srcdir}"/dkms.conf "${pkgdir}"/usr/src/wireguard-${pkgver}/dkms.conf
	install -m0755 Makefile *.c *.h "${pkgdir}"/usr/src/wireguard-${pkgver}/
	install -m0755 crypto/* "${pkgdir}"/usr/src/wireguard-${pkgver}/crypto/
}

package_wireguard-tools-git() {
	depends=('libmnl')
	provides=('wireguard-tools')
	conflicts=('wireguard-tools')

	cd WireGuard/src/tools/

	make DESTDIR="${pkgdir}/" install
}

