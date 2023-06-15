# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="hathor-wallet-appimage"
pkgver=0.26.0
pkgrel=1
pkgdesc="Hathor Official Wallet for Desktop"
arch=('x86_64')
url="https://hathor.network/"
_githuburl="https://github.com/HathorNetwork/hathor-wallet"
license=("MIT")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://github.com/HathorNetwork/hathor-wallet/releases/download/v0.26.0/Hathor.Wallet-0.26.0.AppImage"
    "LICENSE::https://raw.githubusercontent.com/HathorNetwork/hathor-wallet/master/LICENSE")
sha256sums=('97f5e6827f5dec28417ee3fb28abec169844c98ceb1c22dcefa3ce9f23b9b21e'
            '8fc34ede2d7615b4ef2eee1acfa4a457ab3e7c317e4ba6a1354b3b57ad11cbd0')
    
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/hathor-wallet.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}