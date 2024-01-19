# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Contributor: TrialnError <autumn-wind@web.de>
pkgname=coolterm-bin
_pkgname=CoolTerm
pkgver=2.1.0
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
	'python'
	'python-psutil'
	'libunwind'
	'at-spi2-core'
	'gdk-pixbuf2'
	'cairo'
	'pango'
	'libx11'
)
source=(
	"${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/${_pkgname}RaspberryPi64Bit.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/${_pkgname}RaspberryPi.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/${_pkgname}Linux32Bit.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/${_pkgname}Linux64Bit.zip")
sha256sums=('d913a1332a260a98b11207a5be85055497357cdb69f6669f208b0591bd95fc6b')
sha256sums_aarch64=('2c10c148cdbbe8fa839439510ebf949505734c431efe07efe25698bb5a31ea5e')
sha256sums_armv7h=('941a2f7bad2dc646512e2bbcfa1ea689e0691411d0b9e0480eda6c9c73ec2d5f')
sha256sums_i686=('f0473ee72315d720de5629a71896af5c75c60bf74f1264473aa83fd9aa34835c')
sha256sums_x86_64=('b850b71e48686008b1c5706d23edf9957bc3db6960e6f55142fb64b74aeacae2')
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