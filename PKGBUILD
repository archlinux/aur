# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ariel Abreu <facekapow@outlook.com>
pkgname=gitify-bin
_pkgname=Gitify
pkgver=6.13.0
_electronversion=39
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
sha256sums=('e8059639f0d3d97c99c9c8571dcf08bb7772fbf740ce9eb331d6120b3979389f'
            'e3583a920d79b28287ca8bf4b021c6cbeba746a75073c0c68b0aa64ff0b38961'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
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
