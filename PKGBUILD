# Maintainer: Rudolf Schmidt <info@rudolfschmidt.com>

pkgname=sipgate
pkgdesc="sipgate App - Telephony desktop application for sipgate customers"
pkgver=2.37.1
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
	'40f37643fb0c4d1b60b43282efd9cd5ba33c4f563c08ee18fbc648efde164ef9110d19579021693c92e8e02009635b76cf3883f4f394c35453fba6f0506fca2e'
	'825df4ee333207915ad1089e25bb752f8699a60f32006366e7c603e5e918e2166ac3b0b3e7a4a02c6c3dc41e026b18cade0b886a029adb0078bc114715a9a853'
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

	# patch .desktop file to launch via the wrapper so VITE_WORKSPACE_BASE_URL is set
	sed -i 's|^Exec=/opt/sipgate/sipgate-desktop|Exec=/opt/sipgate/run-sipgate-desktop.sh|' \
		"${pkgdir}/usr/share/applications/sipgate-desktop.desktop"
}
