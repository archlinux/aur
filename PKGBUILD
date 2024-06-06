## Maintainer: Adi Prasetya <t.me/adiwastaken>

pkgname=mcpelauncher-appimage
_pkgname=${pkgname/appimage/ui-qt}
_pkgver=0.15.0-795
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/minecraft-linux/appimage-builder"
license=('GPL3' 'MIT')
depends=()
optdepends=('zenity: custom skin picker')
provides=(mcpelauncher-ui-qt)
conflicts=(mcpelauncher-ui-qt)
options=(!strip)
source_x86_64=("mcpelauncher-x86_64-v${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-x86_64-v${pkgver}.AppImage")
source_armv7h=("mcpelauncher-armv7h-v${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-armhf-v${pkgver}.AppImage")
source_aarch64=("mcpelauncher-aarch64-v${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-arm64-v${pkgver}.AppImage")
sha512sums_x86_64=('5a2de9157d1acd6e4cc148ee9fc42fe390a386ce0c45381568422d8a2e3705706b26737be9c52cd155f4ac01d4ad5a46c466b547a06da8164c70992d4efd3878')
sha512sums_armv7h=('f22640dc627e85a49ee0742cd8521e9a2a1f8dae5c0d3c67857fccb34af9c63306895487654a391ef588e2826f8d4453f26cf08fe07f78cee7077185164a2725')
sha512sums_aarch64=('024d2e6829e0c5feefbccbea936455c246273f2f80eedb11041c3964c163437bb95bbb9aadd948b8712a9a7c234524522010d701b31899be8fc13db963bbfd8b')
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
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    cp -r "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}"
    ln -s "/opt/${_pkgname}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
