# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jlivertool-bin
pkgver=2.4.2
_electronversion=35
pkgrel=1
pkgdesc="Bilibili 弹幕机.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="http://jlivertool.xinrea.cn/"
_ghurl="https://github.com/Xinrea/JLiverTool"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/Xinrea/JLiverTool/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('4beee8b771a3d4a459de250aace9396c9c6f96da4d2e8ea1bb7a7053c50c5be9'
            '5d86e387ac33cf32eee9c968d38483a30567690b843c3768b35fe4bc55b455a8'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    rm -rf \
        "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/bufferutil/prebuilds/"{darwin-*,win32-*} \
        "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/fontlist/libs/"{darwin,win32}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps//${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
