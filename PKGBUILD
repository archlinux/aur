## Maintainer: Adi Prasetya <t.me/adiwastaken>

pkgname=mcpelauncher-appimage
_pkgname=${pkgname/appimage/ui-qt}
_pkgver=1.0.0-798
pkgver="${_pkgver/-/.}"
pkgrel=2
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/minecraft-linux/appimage-builder"
license=('GPL-3.0-only' AND 'MIT')
depends=()
makedepends=('desktop-file-utils')
optdepends=('zenity: custom skin picker')
provides=(mcpelauncher-linux mcpelauncher-ui)
conflicts=(mcpelauncher-linux mcpelauncher-ui)
options=(!strip)
source_x86_64=("mcpelauncher-x86_64-v${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-x86_64-v${pkgver}.AppImage")
source_armv7h=("mcpelauncher-armv7h-v${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-armhf-v${pkgver}.AppImage")
source_aarch64=("mcpelauncher-aarch64-v${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-arm64-v${pkgver}.AppImage")
sha512sums_x86_64=('5f9cb98dd4c7a7a286ca224546b7b8a8f6474859c4a87951ebe54befbde42ba18778eac2fafc4bca4523de21ba3d120476bd4904589e10b1650e4ff5a773fe82')
sha512sums_armv7h=('bfab2dab83d03c93b70c3444262fa815f3b11a23876a741869a851fdea4fa70ac32fccc077e05562c43fc08de18b34c92360bd10c4a53d0b48d6c21284fed8ab')
sha512sums_aarch64=('ccbde22b9f45e6e30a128029827073342a76e087d3bfce7f5abba7b0d4aecf79d2c83a1197368efab7a53dfcb1fb44399e6c2468273d15455ce7e1c31fb9e143')
_fileName="mcpelauncher-${CARCH}-v${pkgver}.AppImage"
_desktopFile="usr/share/applications/mcpelauncher-ui-qt.desktop"
_scalableIcon="usr/share/icons/hicolor/scalable/apps/mcpelauncher-ui-qt.svg"

prepare() {
    rm -rf "${srcdir}/squashfs-root"
    chmod +x "${srcdir}/${_fileName}"
    "${srcdir}/${_fileName}" --appimage-extract
    desktop-file-edit --set-key="Exec" --set-value="/usr/bin/mcpelauncher-ui-qt %U" "${srcdir}/squashfs-root/${_desktopFile}"
}

package() {
    # Install icon & desktop
    install -Dm644 "${srcdir}/squashfs-root/${_scalableIcon}" "${pkgdir}/${_scalableIcon}"
    install -Dm644 "${srcdir}/squashfs-root/${_desktopFile}" "${pkgdir}/${_desktopFile}"
    # Install source
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    cp -r "${srcdir}/squashfs-root/." "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    ln -s "/opt/${pkgname}/usr/bin/mcpelauncher-client" "${pkgdir}/usr/bin/mcpelauncher-client"
}
