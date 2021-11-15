# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=netns-helper
pkgname=netns-helper-git
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=r46.d9381ec
pkgrel=1
pkgdesc='Helper systemd services to create network namespaces for other programs and services.'
url="https://gitlab.com/patlefort/${_pkgname}"
license=('GPL3')
depends=('systemd' 'iproute2')
arch=('any')
optdepends=()
makedepends=('git' 'libxslt' 'docbook-xsl' 'docbook5-xml')
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
	mkdir -p "build/man" && cd "build/man"
	xsltproc 'http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl' "${srcdir}/${_pkgname}/man/manual.xml"
}

package() {
	cd "${_pkgname}"
	
	DESTDIR="${pkgdir}" PREFIX=/usr ./install.sh
	
	install -Dm644 "${srcdir}/build/man/"* -t "${pkgdir}/usr/share/man/man1"
	install -Dm644 'license.txt' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
