# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="bilibilivideodownload-bin"
pkgver=3.3.3
pkgrel=1
pkgdesc="Cross-platform download bilibili video desktop software."
arch=('x86_64')
url="https://github.com/blogwy/BilibiliVideoDownload"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron' 'nodejs')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/BilibiliVideoDownload-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/BilibiliVideoDownload/BilibiliVideoDownload/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('e623be15d2779963943d4290cdfa89aa5d685fb0d78eee0a252cf908d60f6ba2'
            'e4d41ebef13a799b7ae9dceebe3a39a6c3e7c18c7a91728c0a73a8ae4baabcc3'
            '011d22cc9fa437b04a08ed7a0d57403c1ca42753a4c43029582bb0b975ba60c8')
     
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
 
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}