# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="video-hub-app-bin"
pkgver=3.2.0
pkgrel=1
pkgdesc="The fastest way to browse and search for videos on your computer. Think of it like YouTube for videos on your computer: browse, search, and preview."
arch=('x86_64')
url="https://videohubapp.com/"
_githuburl="https://github.com/whyboris/Video-Hub-App"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'hicolor-icon-theme' 'electron22')
_install_path="/opt/appimages"
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Video.Hub.App.3.Demo-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/whyboris/Video-Hub-App/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('5264acfd9d4e3ca0ce7332acaeb74431c49b48e9f50f01bd9f45074ea323577b'
            '096d751c3b4fea8ec7f2c8600137020ac6d1ab74b27a6353d1a3dca4271bc9f0'
            'a6a84530c8c3d3484abdbe96e05132829e608cee6da2802e73eca7d067882505')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}-3.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|${pkgname%-bin}-3|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}-3.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}-3.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}