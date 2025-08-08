# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=elecap-bin
_pkgname=VDON.Electron.Capture.App
pkgver=2.20.1
_electronversion=36
pkgrel=1
pkgdesc="Playback video in a frameless electron app for screen-sharing and window capture.(Prebuilt version.Use system-wide electron)"
arch=(
    #'aarch64'
    #'armv7h'
    'x86_64'
)
url="http://electroncapture.app"
_ghurl="https://github.com/steveseguin/electroncapture"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
    'fuse2'
)
source=("${pkgname%-bin}.sh")
#source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-arm64.AppImage")
#source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-armv7l.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-x86_64.rpm")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_x86_64=('da7389f53ab80a107d3cb92718f140d039eca80704b0b71e8d08784f36f42fcf')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
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
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\///g
        s/public.build.automation/AudioVideo/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}