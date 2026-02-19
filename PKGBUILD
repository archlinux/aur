# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: René Wagner <rwa at clttr dot info>
# Contributor: Juan Simón <play4pro at protonmail dot com>
# Contributor: alium
# Contributor: angelsl
# Contributor: hayao <hayao@fascode.net>

_pkgbase=r8168
pkgname=${_pkgbase}-dkms
pkgver=8.056.02
pkgrel=1
pkgdesc="A kernel module for Realtek 8168 network cards (DKMS version)"
url="https://github.com/mtorromeo/$_pkgbase"
license=("GPL-2.0-or-later")
arch=('i686' 'x86_64')
depends=()
makedepends=('git')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("r8168-dkms::git+${url}.git#tag=${pkgver}"
        'dkms.conf')
sha256sums=('ea7a1341bafb6850f772591a7df4c9ca79714d8328fd0d118ebcf2bed554f53a'
            '887ac677d4244e1efb284ec339432571c671174793158c51fc9ac7ebf47cf402')

package() {
	depends+=('glibc' 'dkms' 'linux-firmware-realtek')

	install -Dm644 'dkms.conf' "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	sed -e "s/@PKGNAME@/${_pkgbase}/g" \
	    -e "s/@PKGVER@/${pkgver}/g" \
	    -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	cd "${pkgname}"
	cp -dr --no-preserve='ownership' src "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"

	echo "blacklist r8169" | \
		install -Dm644 '/dev/stdin' "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"
}
