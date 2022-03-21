# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=dyndhcpd-git
pkgver=0.1.8.r0.gdd3e1ed
pkgrel=1
pkgdesc='start DHCP daemon that dynamically creates configuration based on assigned IP address - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/dyndhcpd'
depends=('dhcp')
optdepends=('ipxe: for network boot')
makedepends=('git' 'discount')
license=('GPL')
conflicts=('dyndhcpd')
provides=('dyndhcpd')
backup=('etc/dyndhcpd/dhcpd.conf')
source=('git+https://github.com/eworm-de/dyndhcpd.git')
sha256sums=('SKIP')

pkgver() {
	cd dyndhcpd/

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
	cd dyndhcpd/

	make
}

package() {
	cd dyndhcpd/

	make DESTDIR="${pkgdir}" install
}
