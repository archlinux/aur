# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="nora-appimage"
pkgver=2.2.0stable
_appver=2.2.0-stable
pkgrel=1
pkgdesc="An elegant music player built using Electron and React. Inspired by Oto Music for Android by Piyush Mamidwar."
arch=('x86_64')
url="https://github.com/Sandakan/Nora"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
options=(!strip)
_install_path="/opt/appimages/"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${_appver}/Nora-Setup-${_appver}-linux-${arch}.AppImage"
    "LICENSE.txt::https://raw.githubusercontent.com/Sandakan/Nora/master/LICENSE.txt")
sha256sums=('59d5ab673b447032a0006e43bc4c2e7928fbbde9a42ff7a2b1f117cf51241049'
            '7c27f3771d31e4ba1a227b2aec04ff8892512ba80dd0fb9435115a6523e2980e')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/nora.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${pkgname%-appimage}.xml" -t "${pkgdir}/usr/share/mime"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}