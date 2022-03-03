# Maintainer: dplusdplus <echo cmFuZG9tdGVzdG5hbWUtYXQtZ21haWwoZG90KWNvbQo= | base64 -d>

_pkgname=va-11-hall-a
pkgname=${_pkgname}-gog
pkgver=1.2.3.0
pkgrel=1
arch=('i686' 'x86_64')
license=(custom)
groups=('games' 'gog')

pkgdesc="Bartender simulator visual novel game"
url="https://waifubartending.com"

depends=(
	'lib32-glu'
	'lib32-libxrandr'
	'lib32-openal'
	'lib32-openssl-1.0'
)
makedepends=(
	'p7zip'
)
optdepends=(
	'firejail: sandboxing'
)

source=(
	"gog://va_11_hall_a_cyberpunk_bartender_action_en_1_2_3_0_18496.sh"
	"${pkgname}"
	"${pkgname}.desktop"
	"${pkgname}.profile"
	"0000-start.sh.patch"
)
sha512sums=(
	'1f5a10cc3b543b355adff3c09ae5e44f5050b20d3bfb9e704cfe06f2e894045d743ccf3e94aef5f7dd4b444e9cf18abc7800718f04280c83c441e46d664902da'
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

	# Executable permissions
	chmod +x "${pkgdir}/opt/${pkgname}/game/runner"

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
