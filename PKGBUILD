# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tiddlywiki-app-bin
_pkgname='TiddlyWiki App '
pkgver=4.8.1
_electronversion=36
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
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('74c18e50410f2ca44c052ad70c423be92695a377aa0e6e7bfbc93ae78afaa835')
sha256sums_x86_64=('af5067cf27a1c655d2b2179df9ea7620f66bab7f11f093ff1f5c8d570d903c8e')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
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
