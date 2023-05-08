# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="botframework-emulator-appimage"
_appname=@bfemulatormain
pkgver=4.14.1
pkgrel=1
pkgdesc="A desktop application that allows users to locally test and debug chat bots built with the Bot Framework SDK."
arch=('x86_64')
url="https://aka.ms/botemulator"
_githuburl="https://github.com/microsoft/BotFramework-Emulator"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/BotFramework-Emulator-${pkgver}-linux-x86_64.AppImage"
    "LICENSE.txt::https://raw.githubusercontent.com/microsoft/BotFramework-Emulator/main/LICENSE.txt")
sha256sums=('5f2e79494dd8e326c1dea2e45ced0005d16a9e534a85eb6cd3bf0a5ecb3c849f'
            '31bec773a6a3d56327cdc6149027250e6730014ba46a0ad432e8e11914baae52')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/botframework-emulator.AppImage|g;s|@bfemulatormain|botframework-emulator|g' \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}