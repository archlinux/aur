# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=botframework-emulator-bin
_appname="@bfemulatormain"
pkgver=4.14.1
pkgrel=2
pkgdesc="A desktop application that allows users to locally test and debug chat bots built with the Bot Framework SDK."
arch=('x86_64')
url="https://aka.ms/botemulator"
_githuburl="https://github.com/microsoft/BotFramework-Emulator"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron13' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/BotFramework-Emulator-${pkgver}-linux-x86_64.AppImage"
    "LICENSE.txt::https://raw.githubusercontent.com/microsoft/BotFramework-Emulator/main/LICENSE.txt"
    "${pkgname%-bin}.sh")
sha256sums=('5f2e79494dd8e326c1dea2e45ced0005d16a9e534a85eb6cd3bf0a5ecb3c849f'
            '31bec773a6a3d56327cdc6149027250e6730014ba46a0ad432e8e11914baae52'
            '9a2884db7fddb57ae22e2ef36ac6a86321f77079e85a3b56fd861e6014dc6fc5')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    sed "s|AppRun %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}