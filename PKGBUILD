# Maintainer: Oliver Wegner <oliver.wegner(at)csr-informatik(dot)de>

pkgname=sipgate-app-clinq
pkgdesc="Telephony desktop application for sipgate Clinq customers"
pkgver=2.7.1
_distfile="sipgate%20CLINQ-${pkgver}-amd64.deb"
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
	'a59d4fc894688f9b4b30d9f6ae37e4f5ad34f8d4c0ec430b1bd96b4877e4f084c11cd4a5a1968628dd27ceb103c9e0b81c82b003f175d4bc9013144b89a6b13e'
	'3dbd3a9f84f41eac4a5d0b5db42a45db10a6b3655c07a303fe7de3f2c1d5efa4217d33ff7d7e610c7329d475d951f07aa6cfc421a0f090a62f8b0b0b5b8c05be'
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
	mv "${pkgdir}/opt/sipgate CLINQ/LICENSE.electron.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/"
	mv "${pkgdir}/opt/sipgate CLINQ/LICENSES.chromium.html" \
		"${pkgdir}/usr/share/licenses/${pkgname}/"

	# copy run script
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "run-sipgate-desktop.sh" \
		"${pkgdir}/opt/sipgate CLINQ/run-sipgate-desktop.sh"
	ln -s "/opt/sipgate CLINQ/run-sipgate-desktop.sh" \
		"${pkgdir}/usr/bin/sipgate-desktop"
}
