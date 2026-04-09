# Maintainer: Rudolf Schmidt <info@rudolfschmidt.com>

pkgname=sipgate
pkgdesc="sipgate App - Telephony desktop application for sipgate customers"
pkgver=2.33.9
_distfile="sipgate-${pkgver}-amd64.deb"
pkgrel=1
arch=('x86_64')
url="https://sipgate.de/app"
license=('LicenseRef-custom')
depends=()
makedepends=('dpkg')
provides=('sipgate')
conflicts=('sipgate-app-clinq')
options=('!debug')
source=(
	"https://desktop.download.sipgate.com/${_distfile}"
	"run-sipgate-desktop.sh"
)
noextract=("${_distfile}")
b2sums=(
	'b4cc7639c68544f9cd8bf161b9b68f1a6114f9e2d8ded1b553db1aaef5102a0ecfc433b73d1f8464e8857b80c544fdb0849858d871ffb92a15e0d56dc4cb5085'
	'c9bc2f241256f04ea1f30fc6a79af35927054d09541ab37f96a8374dc1c96cebddf3774d8a9c9fa39cd9f031cde559f670dddc040b815c1106945f7f7e4d4cad'
)

pkgver() {
	# shellcheck disable=SC2016
	dpkg-deb --show --showformat='${Version}' "${_distfile}" | tr - .
}

package() {
	depends=(
		'gtk3' 'libsecret' 'util-linux-libs' 'at-spi2-core' 'xdg-utils'
		'libxtst' 'libxss' 'nss' 'libnotify' 'alsa-lib'
		'sed' 'yq' 'wget' 'libnotify' 'pacman'
	)

	# extract original distfile
	bsdtar -O -xf "${_distfile}" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

	# move LICENSE files to intended location
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	mv "${pkgdir}/opt/sipgate/LICENSE.electron.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/"
	mv "${pkgdir}/opt/sipgate/LICENSES.chromium.html" \
		"${pkgdir}/usr/share/licenses/${pkgname}/"

	# copy run script
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "run-sipgate-desktop.sh" \
		"${pkgdir}/opt/sipgate/run-sipgate-desktop.sh"
	ln -s "/opt/sipgate/run-sipgate-desktop.sh" \
		"${pkgdir}/usr/bin/sipgate-desktop"
}
