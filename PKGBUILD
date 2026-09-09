# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: René Wagner <rwa at clttr dot info>
# Contributor: Juan Simón <play4pro at protonmail dot com>
# Contributor: alium
# Contributor: angelsl
# Contributor: hayao <hayao@fascode.net>

_pkgbase=r8168
pkgname=${_pkgbase}-dkms
_pkgver=8.056.02
pkgver=8.057.00
pkgrel=1
pkgdesc="A kernel module for Realtek 8168 network cards (DKMS version)"
url="https://github.com/mtorromeo/$_pkgbase"
license=("GPL-2.0-only")
arch=('i686' 'x86_64')
depends=()
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("${pkgname%-*}-${_pkgver}.tar.gz::$url/archive/refs/tags/${_pkgver}.tar.gz" #todo: change back to pkgver once PR is accepted
	"8-057-00-update.patch::https://patch-diff.githubusercontent.com/raw/mtorromeo/r8168/pull/73.patch"
        'dkms.conf')
sha256sums=('f8354f4018ae11c651d7df737323c317f14ed6af68066372badeba57c99b7a12'
            'e89ba691fc4e8d3139500f34f247347f6f9f1c5a44278b3bbeaa37325d7a69d8'
            '887ac677d4244e1efb284ec339432571c671174793158c51fc9ac7ebf47cf402')

prepare() {
	cd "$srcdir/${pkgname%-*}-${_pkgver}"
	patch -Np1 < "$srcdir/8-057-00-update.patch"
}

package() {
	depends+=('dkms' 'linux-firmware-realtek')

	install -Dm644 'dkms.conf' "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	sed -e "s/@PKGNAME@/${_pkgbase}/g" \
	    -e "s/@PKGVER@/${pkgver}/g" \
	    -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	cd "${pkgname%-*}-${_pkgver}"
	cp -dr --no-preserve='ownership' src "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"

	echo "blacklist r8169" | \
		install -Dm644 '/dev/stdin' "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"
}
