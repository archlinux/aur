# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tiddlywiki-app-bin
_pkgname='TiddlyWiki App '
pkgver=4.9.11
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
sha256sums=('801cd318b77f7cc43b71e5bf59b79476c94d4981025655f7d1c4f3ef4faaf162'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('5ed5d91f3489a58856afef4e69c062838fb636ec7f441ecd28d34a5da0c1867d')
sha256sums_x86_64=('366852136be25f93fe52180a55548382079cde36adf4ad91edb3d77ac3d7400c')
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
