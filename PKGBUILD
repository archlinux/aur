# Maintainer: Rudolf Schmidt <info@rudolfschmidt.com>

pkgname=sipgate
pkgdesc="sipgate App - Telephony desktop application for sipgate customers"
pkgver=2.39.3
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
b2sums=('d4ded01ffa9ff629cf219997c2767f04d2d01fb460db0259d47afcdd98829926edf4046109a90104cdfce40b627d499217836dee96347fdf5da4a3b551f51661'
        '44fae56c473ebe12addbdd38e59ba6a0fd933b271c0f23b35a5febe21f850177376dad83684914e5660d654129eb9059ef9291af5a8be88bc35fdc01199596dd')

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
