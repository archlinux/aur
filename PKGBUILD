# Maintainer: muchweb <aleks@s-ko.net>

pkgname=tidal-music-linux-bin
_pkgname=tidal-music-linux
pkgver=1.0
pkgrel=7
pkgdesc='An electron based wrapper around the Tidal web player for Linux'
arch=('x86_64')
url='https://github.com/Bunkerbewohner/tidal-music-linux'
license=('MIT')
# dunno if needed: libxtst alsa-lib gconf libnotify gtk2 nss
depends=('pepper-flash')
makedepends=('rsync')
provides=("${_pkgname}")
source=(
	"https://github.com/Bunkerbewohner/tidal-music-linux/releases/download/v${pkgver}/tidal-music-linux-v${pkgver}-x64.zip"
	"${_pkgname}.desktop"
)
sha256sums=(
	'f927373db264d2d952cadde9fd35ddd7020b0e9ff6a49297973d84737d7bac43'
	'53e36cb536c5ea088cdd633c43d14634659a5676199c3f8ec10049e7bde32300'
)

package() {
	rm -rf "${srcdir}/${_pkgname}-v${pkgver}/resources/app/.git"

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	mv "${srcdir}/${_pkgname}-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"

	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	rsync --archive "${srcdir}/${_pkgname}-v${pkgver}/" "${pkgdir}/usr/share/${pkgname}"
	chmod -R a+r "${pkgdir}/usr/share/${pkgname}"
	find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod a+x {} \;

	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/usr/share/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	echo "${srcdir}"
	ls "${srcdir}"
	install -D "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
