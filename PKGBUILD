# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ariel Abreu <facekapow@outlook.com>
pkgname=gitify-bin
_pkgname=Gitify
pkgver=5.13.1
_electronversion=31
pkgrel=1
pkgdesc="GitHub notifications on your menu bar"
arch=('x86_64')
url="https://www.gitify.io/"
_ghurl="https://github.com/gitify-app/gitify"
license=('MIT')
depends=(
	"electron${_electronversion}"
)
source=(
	"${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/gitify-app/gitify/v$pkgver/LICENSE"
	"${pkgname%-bin}.sh"
)
sha256sums=('930b904b41dad0f984cf6d9eb8afeef4d2a787066893e1d7e577e60f39608330'
            'e3583a920d79b28287ca8bf4b021c6cbeba746a75073c0c68b0aa64ff0b38961'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
	sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
    	install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
			-t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
	done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}