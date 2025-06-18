# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Contributor: TrialnError <autumn-wind@web.de>
pkgname=coolterm-bin
_pkgname=CoolTerm
pkgver=2.4.0
pkgrel=1
pkgdesc="Simple GUI serial port terminal application (no terminal emulation).Prebuilt version."
arch=(
	'aarch64'
	'armv7h'
	'i686'
	'x86_64'
)
url="https://freeware.the-meiers.org"
license=('LicenseRef-Freeware')
conflicts=("${pkgname%-bin}")
depends=(
	'gtk3'
	'python>=3'
	'python-psutil'
	'libunwind'
)
source=(
	"${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/${_pkgname}RaspberryPi64Bit.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/${_pkgname}RaspberryPi.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/${_pkgname}Linux32Bit.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/${_pkgname}Linux64Bit.zip")
sha256sums=('7256543ea2a5270331c93ddc474347dffc5cbe30e7073770bd23fee3350a7e8d')
sha256sums_aarch64=('a01efbd5be7c1af24170f453078c4c6ab18aed889c4fb94e511a9135510130bb')
sha256sums_armv7h=('3934557c0a6fb62e1eeb56bb4b8b385db8471079e005a7106714ac57fe8fa861')
sha256sums_i686=('b79470c4528d9168228ea96544054c81af512f9261fbd4bcffb039528e48beca')
sha256sums_x86_64=('33375a6c354e40d2ba5d0b2ee2e1d07c50ac5451000f6451d4bddaa93bbe3f13')
prepare() {
	sed -i -e "
		s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
	sed -i -e "
		s/Exec=.\/${_pkgname} /Exec=${pkgname%-bin}/g
		s/Icon=.\/${_pkgname} Resources\/appicon_128.png/Icon=${pkgname%-bin}/g
		6i\Categories=System;Utility
	" "${srcdir}/${_pkgname}"*/"${_pkgname}.desktop"
	find "${srcdir}/${_pkgname}"* -type f -name "*.*" -exec chmod 644 {} +
	find "${srcdir}/${_pkgname}"* -type f -name "*.py" -exec chmod 755 {} +
	find "${srcdir}/${_pkgname}"* -type d -exec chmod 755 {} +
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}"*/* "${pkgdir}/usr/lib/${pkgname%-bin}"
	install -Dm644 "${pkgdir}/usr/lib/${pkgname%-bin}/${_pkgname} Resources/Help/app_icon_256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
	install -Dm644 "${srcdir}/${_pkgname}"*/ReadMe.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}"*/"${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}