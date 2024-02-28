# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Contributor: TrialnError <autumn-wind@web.de>
pkgname=coolterm-bin
_pkgname=CoolTerm
pkgver=2.1.1
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
sha256sums=('d913a1332a260a98b11207a5be85055497357cdb69f6669f208b0591bd95fc6b')
sha256sums_aarch64=('b1d37dcdc4f06a406c96cb18aefde8ad0d63842e8435758a81a27fcdbd902971')
sha256sums_armv7h=('751ee658404b1c547439ecfd09d0649373029462244b21aa9f0504ab1a91d90e')
sha256sums_i686=('d41a8cc14d53a0a30b1f4616ec69f5d10de5764347dc0fc30db70b0533d0b153')
sha256sums_x86_64=('f63a3bba586cd9ec8b152b97182a1f12254327a29797bfeefe16d5b1a3d242f1')
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