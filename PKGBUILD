# Maintainer: dplusdplus <echo cmFuZG9tdGVzdG5hbWUtYXQtZ21haWwoZG90KWNvbQo= | base64 -d>

_pkgname=death-road-to-canada
pkgname=${_pkgname}-gog
pkgver=20221026
pkgrel=2
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
	"gog://death_road_to_canada_mandible_nerve_update_59780.sh"
	"${pkgname}"
	"${pkgname}.desktop"
	"${pkgname}.profile"
	"0000-start.sh.patch"
)
sha512sums=(
	'5dec04d115e82f3e07e96e15a1721cb1490391c566826a4d2c3d33a66f6af241d85872c01d8c4f3df130da6d8fb916ce13ac8546bf1cecc3925bd4d7cccf8d7c'
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
