# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tiddlywiki-app-bin
_pkgname='TiddlyWiki App '
pkgver=4.9.14
_electronversion=39
pkgrel=1
pkgdesc="A TiddlyWiki desktop application that provides a silkier desktop experience.(Prebuilt version.Use system-wide electron)一个 TiddlyWiki 桌面应用，提供更加丝滑的桌面端使用体验。"
arch=(
    'aarch64'
    'x86_64'
)
url="https://oeyoews.github.io/tiddlywiki-app/"
_ghurl="https://github.com/oeyoews/tiddlywiki-app"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'pngquant'
)
options=(
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/oeyoews/tiddlywiki-app/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-aarch64.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-x64.pacman")
sha256sums=('44476e5cbab46cd37f07d1cf806a9b5428d6cfe31b216fc3969db2ce9175e104'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('d5b2f7ed3b015668b2a8289dfd279841fdc8889c79ec06d7ae0207f52f6bc3e4')
sha256sums_x86_64=('ac7833c3bb38183f5666b4e1fe51d0dd2074d0ab5b15d2980a6468734358b8bc')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
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
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/pngquant"
    ln -sf "/usr/bin/pngquant" "${pkgdir}/usr/lib/${pkgname%-bin}/pngquant/pngquant"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
