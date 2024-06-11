# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Contributor: TrialnError <autumn-wind@web.de>
pkgname=coolterm-bin
_pkgname=CoolTerm
pkgver=2.2.0
pkgrel=1
pkgdesc="Simple GUI serial port terminal application (no terminal emulation)"
arch=(
	"aarch64"
	"armv7h"
	"i686"
	"x86_64"
)
url="https://freeware.the-meiers.org"
license=("LicenseRef-Freeware")
conflicts=("${pkgname%-bin}")
depends=(
	'gtk3'
	'python>=3'
	'python-psutil'
)
source=(
	"${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/${_pkgname}RaspberryPi64Bit.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/${_pkgname}RaspberryPi.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/${_pkgname}Linux32Bit.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/${_pkgname}Linux64Bit.zip")
sha256sums=('806086947b217b6051a76fa8136f6aa78454893467823e0a90d3bf3667bae94a')
sha256sums_aarch64=('97bb5da70ef4b6a3efe845b73ebe5caff6b933345599ebb078745fcced82601b')
sha256sums_armv7h=('c2267fb95c2d6363444bbe326175bd92a7096d23abfb0c387f46464d6b79d31e')
sha256sums_i686=('6b8bd525e790b30d20fb042ffa60fdf34824660fa9ee5afd0e68fa8c0939387e')
sha256sums_x86_64=('f20cd340e48ee6789053236d9a178d7e521d8aea5b770a1df4cd2f6a2dd51ab5')
build() {
	sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
	sed -e "s|Exec=./${_pkgname} |Exec=${pkgname%-bin} %U|g" \
		-e "s|Icon=./${_pkgname} Resources/appicon_128.png|Icon=${pkgname%-bin}|g" \
		-e "6i\Categories=System;Utility" \
		-i "${srcdir}/${_pkgname}"*/"${_pkgname}.desktop"
	find "${srcdir}/${_pkgname}"*/Scripting/Python/Examples -name "*.py" -exec chmod 755 {} \;
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
	cp -r "${srcdir}/${_pkgname}"*/* "${pkgdir}/opt/${pkgname%-bin}"
	install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_pkgname} Resources/Help/app_icon_256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
	install -Dm644 "${srcdir}/${_pkgname}"*/ReadMe.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}"*/"${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}