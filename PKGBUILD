# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=botframework-emulator-bin
_pkgname=BotFramework-Emulator
_appname="@bfemulatormain"
pkgver=4.14.1
pkgrel=4
pkgdesc="A desktop application that allows users to locally test and debug chat bots built with the Bot Framework SDK."
arch=('x86_64')
url="https://aka.ms/botemulator"
_githuburl="https://github.com/microsoft/BotFramework-Emulator"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron13'
    'hicolor-icon-theme'
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${CARCH}.AppImage"
    "LICENSE.txt::https://raw.githubusercontent.com/microsoft/BotFramework-Emulator/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('5f2e79494dd8e326c1dea2e45ced0005d16a9e534a85eb6cd3bf0a5ecb3c849f'
            '31bec773a6a3d56327cdc6149027250e6730014ba46a0ad432e8e11914baae52'
            '54821abed8cf9cf4ac8e5fcf6dca40dbebd3cd8089e1610e068a9018a6ff6b33')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun %U|${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}