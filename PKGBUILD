# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>
# Contributor: TrialnError <autumn-wind@web.de>
pkgname=coolterm-bin
_pkgname=CoolTerm
pkgver=2.3.0
pkgrel=2
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
sha256sums_aarch64=('a1d809cb6b47bfd675615c99ebd532320cc13147b56a5125643e99c6ecf0b102')
sha256sums_armv7h=('848656ad8b79c8df9616a2fe91a9ad991240b120173bbfab7c1907977b61fa11')
sha256sums_i686=('d51567f3dff99424c50e39dedd6e81e8140dc09a427e15ab5268b971fc4aeca8')
sha256sums_x86_64=('e6c52224b3c6a7d017a1811657e84060202171c218fe6526de57995e02c0d5b3')
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