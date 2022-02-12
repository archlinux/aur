# Maintainer: dplusdplus <echo cmFuZG9tdGVzdG5hbWUtYXQtZ21haWwoZG90KWNvbQo= | base64 -d>

_pkgname=death-road-to-canada
pkgname=${_pkgname}-gog
pkgver=20210402
pkgrel=1
arch=('x86_64')
license=(custom)
groups=('games' 'gog')

pkgdesc="Randomly-Generated Road Trip Action-RPG"
url="http://www.deathroadtocanada.com"

depends=(
	'glu'
	'sdl2_mixer'
)
makedepends=(
	'p7zip'
)
optdepends=(
	'firejail: sandboxing'
)

source=(
	"gog://death_road_to_canada_liver_update_46139.sh"
	"${pkgname}"
	"${pkgname}.desktop"
	"${pkgname}.profile"
	"0000-start.sh.patch"
)
sha512sums=(
	'2492170d69788a9e9fbea1ade2039f0f92d88b8152ec1fb0711bd88dbcd9c0ddcd7e869e566c41057cb1035e40fab8e767960c51e42d62bda7b11fce4eccb4af'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)
options=('!strip')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

package() {
	install -d "${pkgdir}/opt/${pkgname}"

	cp -r "data/noarch/game/" "${pkgdir}/opt/${pkgname}/"
	install -D -m 755 "data/noarch/start.sh" "${pkgdir}/opt/${pkgname}/"
	install -D -m 444 "data/noarch/gameinfo" "${pkgdir}/opt/${pkgname}/"
	install -D -m 755 data/noarch/support/*.{sh,shlib} --target-directory="${pkgdir}/opt/${pkgname}/support/"
	install -D -m 644 "data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"


	install -d "${pkgdir}/usr/bin"
	install -D -m644 "${pkgname}" "${pkgdir}/usr/bin"
	chmod 555 "${pkgdir}/usr/bin/${pkgname}"


	patch "${pkgdir}/opt/${pkgname}/start.sh" "0000-start.sh.patch"
	chmod 755 "${pkgdir}/opt/${pkgname}/start.sh"


	install -D -m644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -D -m644 "data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Install firejail profile
	install -D -m644 "${pkgname}.profile" "${pkgdir}/etc/firejail/${pkgname}.profile"

}
