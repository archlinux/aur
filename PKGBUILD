# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=botclient-appimage
_appname=BotClient
pkgver=0.11.0_alpha
pkgrel=3
pkgdesc="A discord botclient built with Electron, React and discord.js."
arch=('x86_64')
url="https://github.com/DarkGuy10/BotClient"
license=('MIT')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}/${_appname}-linux-${CARCH}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/DarkGuy10/BotClient/main/LICENSE")
sha256sums=('076f18fd65eb306e77d18e9835d65b8f9ab496f419a2a908e4a9a5003143692b'
            '56d602455f4872c78a5af3df024c6a8aab858b2e79ed53e417aaa90720b186b0')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    1install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|Chat|Network|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}