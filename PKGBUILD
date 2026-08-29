# Maintainer: Frederic Boltz <frederic.boltz@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>
# Co-Maintainer: Christian Kühn <damachin3 at proton dot me>

_pkgbase=nct6687d
pkgname=${_pkgbase}-dkms-git
pkgver=r225.4864fd6
pkgrel=3
pkgdesc="Nuvoton module for NCT6687-R synced with latest upstream kernel."
arch=('x86_64')
url="https://github.com/Fred78290/nct6687d"
license=('GPL-2.0-or-later')
makedepends=('git')
depends=('dkms')
source=(
	"${_pkgbase}::git+https://github.com/Fred78290/nct6687d"
	"dkms.conf.in"
)
sha256sums=('SKIP'
            'c42b709df3b96aba2739c7319b3591c407d5fb0773f76a06693f127b6408779d')

pkgver() {
	cd "${_pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${_pkgbase}"

	# Source files
	install -dm755 "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
	install -m644 Kbuild Makefile nct6687.c "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

	# License
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Documentation
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# dkms.conf
	install -Dm644 "${srcdir}/dkms.conf.in" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	sed \
		-e "s/@_PKGBASE@/${_pkgbase}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
}
