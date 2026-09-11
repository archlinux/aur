# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: René Wagner <rwa at clttr dot info>
# Contributor: Juan Simón <play4pro at protonmail dot com>
# Contributor: alium
# Contributor: angelsl
# Contributor: hayao <hayao@fascode.net>

_pkgbase=r8168
pkgname=${_pkgbase}-dkms
pkgver=8.057.00
pkgrel=2
pkgdesc="A kernel module for Realtek 8168 network cards (DKMS version)"
url="https://github.com/mtorromeo/$_pkgbase"
license=("GPL-2.0-only")
arch=('i686' 'x86_64')
depends=()
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("${pkgname%-*}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz"
        'dkms.conf')
sha256sums=('dbe713d07a245c6c49210577b7bbf21c9bcfee86e2fdfbcabff9df708313b070'
            '887ac677d4244e1efb284ec339432571c671174793158c51fc9ac7ebf47cf402')

prepare() {
	cd "$srcdir/${pkgname%-*}-${pkgver}"
}

package() {
	depends+=('dkms' 'linux-firmware-realtek')

	install -Dm644 'dkms.conf' "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	sed -e "s/@PKGNAME@/${_pkgbase}/g" \
	    -e "s/@PKGVER@/${pkgver}/g" \
	    -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	cd "${pkgname%-*}-${pkgver}"
	cp -dr --no-preserve='ownership' src "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"

	echo "blacklist r8169" | \
		install -Dm644 '/dev/stdin' "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"
}
