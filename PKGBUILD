# Maintainer: Oliver Wegner <oliver.wegner(at)csr-informatik(dot)de>

pkgname=sipgate-app-clinq
pkgdesc="Telephony desktop application for sipgate customers"
pkgver=2.28.2
_distfile="sipgate-${pkgver}-amd64.deb"
pkgrel=1
arch=('x86_64')
url="https://sipgate.de/app"
license=('LicenseRef-custom')
depends=()
makedepends=('dpkg')
provides=('sipgate-app-clinq')
options=('!debug')
source=(
	"https://desktop.download.sipgate.com/${_distfile}"
	"run-sipgate-desktop.sh"
)
noextract=("${_distfile}")
b2sums=(
	'ae1f3eeaacee7d3024e260f4ce94774b99c760d5ef8a0f74927d9e42b4645d4c458fd384eba65bdb442963ab89723a7f780bd68834a66df38d3569183b786648'
	'16f877664cb574917a7c5f6d310523e0dda7b00c162621410fc81de94e85f2a6699749210c931b7269b1063d434c41da44c5ee96cbb0eb621420746a76723830'
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
