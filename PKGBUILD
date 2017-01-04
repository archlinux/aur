# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=wireguard-git
pkgname=(wireguard-dkms-git wireguard-tools-git)
pkgver=0.0.20161230.r6.g4c78977
pkgrel=1
pkgdesc='next generation secure network tunnel - git checkout'
arch=('x86_64' 'i686')
url='http://www.wireguard.io/'
license=('GPL')
makedepends=('git' 'libmnl' 'bash-completion')
source=('git+https://git.zx2c4.com/WireGuard')
sha256sums=('SKIP')

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

prepare() {
	cd WireGuard/

	find contrib/examples/ -name '.gitignore' -delete
}

build() {
	cd WireGuard/

	make -C src/tools/
}

package_wireguard-dkms-git() {
	depends=('dkms')
	provides=('wireguard-dkms' 'WIREGUARD-MODULE')
	conflicts=('wireguard-dkms')

	cd WireGuard/

	make -C src/ DESTDIR="${pkgdir}/" DKMSDIR="/usr/src/wireguard-${pkgver}/" dkms-install
}

package_wireguard-tools-git() {
	depends=('libmnl' 'WIREGUARD-MODULE')
	provides=('wireguard-tools')
	conflicts=('wireguard-tools')

	cd WireGuard/

	make -C src/tools/ DESTDIR="${pkgdir}/" install

	install -d -m0755 "${pkgdir}"/usr/share/${pkgbase}/
	cp -r contrib/examples/ "${pkgdir}"/usr/share/${pkgbase}/
}

