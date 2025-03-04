# Maintainer: Oliver Wegner <oliver.wegner(at)csr-informatik(dot)de>

pkgname=sipgate-app-clinq
pkgdesc="Telephony desktop application for sipgate Clinq customers"
pkgver=2.5.48
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
	'59293fca8403c166035b97c6b4e16f453e1450c340befa107f5be4ed1e5ab99ffc96745313d61c3f1ec016d24e2f5828367069619afffa1b54e876e428fc9cc0'
	'fa1fe9461f76a9c24a6fb53c6333d39dd68d5bcec572766565464ab27114e4ad9ff3019624ce042fb9bcccb5f08874ddc4fbccde4b8c1fc5112da785700d5944'
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
