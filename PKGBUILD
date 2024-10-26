## Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
## Contributor: Adi Prasetya <t.me/adiwastaken>

pkgname=mcpelauncher-appimage
_pkgname=${pkgname/appimage/ui-qt}
_pkgver=1.1.1-802
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/minecraft-linux/appimage-builder"
license=('GPL-3.0-only' 'MIT')
depends=(glibc gcc-libs)
makedepends=('desktop-file-utils')
optdepends=('zenity: custom skin picker')
conflicts=(mcpelauncher-linux mcpelauncher-ui)
options=(!strip)
source_x86_64=("mcpelauncher-x86_64-v${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-x86_64-v${pkgver}.AppImage")
source_armv7h=("mcpelauncher-armv7h-v${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-armhf-v${pkgver}.AppImage")
source_aarch64=("mcpelauncher-aarch64-v${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-arm64-v${pkgver}.AppImage")
sha512sums_x86_64=('29a34d48b06df0683ff0c99e00fb653385ce715a326a490d968331b2bd6133212d23ef3d22548a4569afcfaa41233ab8cc09b684729a79cb3263d1f355e9a5ad')
sha512sums_armv7h=('b1c6167f31b7005169ac2e8d4f98fe78844645e90cfe79105ac03b2e5d867eefbfe199ef90d07bb557db82129a3d2d63e72728add5974adb935ea800a02e2a45')
sha512sums_aarch64=('b59cf0cf182a1bb9092c696443f5255f6e172779dc137163aed21c22b86e41cfbb74a50b1f2b7de2c0bbb3a6fcee434b26441f429fa10953fca24c1e9bf54a81')
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
