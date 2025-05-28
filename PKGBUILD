# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ariel Abreu <facekapow@outlook.com>
pkgname=gitify-bin
_pkgname=Gitify
pkgver=6.4.1
_electronversion=36
pkgrel=1
pkgdesc="GitHub notifications on your menu bar.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://www.gitify.io/"
_ghurl="https://github.com/gitify-app/gitify"
license=('MIT')
depends=(
	"electron${_electronversion}"
)
source=(
	"${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.${CARCH}.rpm"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/gitify-app/gitify/v$pkgver/LICENSE"
	"${pkgname%-bin}.sh"
)
sha256sums=('9a610b97357f9c3b8f3c6540900ff73128fa107e099284c810a1182e8db54e53'
            'e3583a920d79b28287ca8bf4b021c6cbeba746a75073c0c68b0aa64ff0b38961'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
	sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
			-t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
	done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
