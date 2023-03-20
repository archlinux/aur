# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=netns-helper
pkgname=${_pkgname}-git
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=r74.e52bba7
pkgrel=1
pkgdesc='Helper systemd services to create network namespaces for other programs and services.'
url="https://gitlab.com/patlefort/${_pkgname}"
license=('GPL3')
depends=('systemd' 'iproute2')
arch=('any')
optdepends=(
	'nftables: nat feature'
	'bash-completion'
	'dnsmasq: DNS support'
	'dhcpcd: DHCP support'
	'openresolv: for dhcpcd')
makedepends=('git' 'libxslt' 'docbook-xsl-ns' 'cmake')
sha256sums=('SKIP')
source=("git+https://gitlab.com/patlefort/${_pkgname}")
options=('!strip')

pkgver() {
	cd "${_pkgname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cmake -S "${_pkgname}" -B 'build' -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build 'build'
}

package() {
	DESTDIR="${pkgdir}" cmake --install 'build'
	
	install -dm755 "${pkgdir}/etc/netns-helper/ns"
	install -Dm644 "${_pkgname}/license.txt" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
