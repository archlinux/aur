# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="quark-player-appimage"
pkgver=3.1.1
pkgrel=1
pkgdesc="An Electron based Web Video Services Player, supporting Netflix, Youtube, Twitch, Floatplane, Hulu and More!"
arch=('x86_64')
url="https://github.com/Alex313031/quark-player"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}_${pkgver}_${arch}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Alex313031/quark-player/master/LICENSE")
sha256sums=('4fc30c1525ba4ed0bdd7cc84556ab4262172be6e4f676b019a762572b3e62ad8'
            'f60c2918d56a97a03b92e13e9fc479e81db309476ec26f7c8c0df82007612117')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/quark-player.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}