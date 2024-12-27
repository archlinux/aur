# Maintainer: Lorenzo Zolfanelli <dev(at)zolfa(dot)nl>

_pkgbase="nxp-pn5xx"
_git_repo="https://github.com/jr64/nxp-pn5xx"
_git_branch="master"
pkgname="${_pkgbase}-dkms-git"
pkgver=0.0.1.r11.g1274976
pkgrel=1
pkgdesc="Kernel mode driver for NXP pn5xx NFC readers with ACPI autodiscovery"
arch=('any')
url="https://github.com/jr64/nxp-pn5xx"
license=('GPL-2.0-only')
depends=('dkms')
provides=("${_pkgbase}-dkms=${pkgver}")
conflicts=("${_pkgbase}")
makedepends=("git")
source=("${_pkgbase}::git+${_git_repo}#branch=${_git_branch}"
	'dkms.conf'
	'nxp-pn5xx.conf')
sha256sums=('SKIP'
            '3c8c4215ba5d17a252b8a74f36adb6a7dc2fe3c4a18b3d3790703505a5662f82'
            '20b96902d6741ba2b165fbc6348740cf407d42839a3af2d89c358da5558b83ea')

package() {
	install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
	    -e "s/@PKGVER@/${pkgver}/" \
	    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

	cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

	install -Dm644 ${_pkgbase}.conf "${pkgdir}/usr/lib/modprobe.d/${_pkgbase}.conf"
}


pkgver() {
	cd ${srcdir}/${_pkgbase}
	printf '%s.r%s.g%s' '0.0.1' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
