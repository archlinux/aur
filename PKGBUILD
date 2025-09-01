# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stremio-enhanced-bin
_pkgname=Stremio.Enhanced
pkgver=1.0.0
_electronversion=37
pkgrel=1
pkgdesc="An Electron-based Stremio client with plugins and themes support. It runs the Stremio Service automatically and loads the web version of Stremio.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://discord.gg/jDsgcehrp7"
_ghurl="https://github.com/REVENGE977/stremio-enhanced-community"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'stremio-service'
    'ffmpeg'
)
makedepends=(
    'asar'
)
source=(
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/REVENGE977/stremio-enhanced-community/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage")
sha256sums=('ed5f1a7791770773ed4aa8ba31fa28b3bb2cc1a263e0ed1997c290a6248a896a'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('8ae2e10d6306afa9f9a85dbccd009486991d3c6b6906b1f5634ced237c4d167b')
sha256sums_x86_64=('a5428a2c7bdb0abb535266b595133b913f8a62375d6b024688a447a640965ef6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/squashfs-root/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
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
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _get_electron_version
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i 's|StreamingServer.streamingServerDir = .*|StreamingServer.streamingServerDir = "/usr/lib/stremio-enhanced/streamingserver";|' \
        "${srcdir}/app.asar.unpacked/dist/utils/StreamingServer.js"
    rm -rf "${srcdir}/app.asar.unpacked/stremio-server/"{macos,windows}
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/streamingserver/server"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/streamingserver"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname%-bin}/streamingserver/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${pkgdir}/usr/lib/${pkgname%-bin}/streamingserver/ffprobe"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}