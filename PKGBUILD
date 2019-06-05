# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=wireguard-git
pkgname=(wireguard-dkms-git wireguard-tools-git)
pkgver=0.0.20190601.r2.gaab8bec
pkgrel=1
pkgdesc='next generation secure network tunnel - git checkout'
arch=('x86_64' 'i686')
url='http://www.wireguard.com/'
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
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
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

	make -C src/ \
		DESTDIR="${pkgdir}/" \
		DKMSDIR="/usr/src/wireguard-${pkgver}/" \
		dkms-install
}

package_wireguard-tools-git() {
	depends=('libmnl' 'WIREGUARD-MODULE')
	optdepends=('openresolv: for DNS functionality')
	provides=('wireguard-tools')
	conflicts=('wireguard-tools')

	cd WireGuard/

	make -C src/tools/ \
		DESTDIR="${pkgdir}/" \
		WITH_BASHCOMPLETION=yes \
		WITH_WGQUICK=yes \
		WITH_SYSTEMDUNITS=yes \
		install

	install -d -m0755 "${pkgdir}"/usr/share/${pkgbase}/
	cp -r contrib/examples/ "${pkgdir}"/usr/share/${pkgbase}/
}

