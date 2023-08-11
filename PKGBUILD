# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flb-music-player-bin
_pkgname=flbmusic
_appname=FLB-Music
pkgver=1.2.1
pkgrel=3
pkgdesc="A beautiful Feature Rich Music Player and Downloader,cross platform"
arch=('x86_64')
url="https://flbmusic.xyz/"
_githuburl="https://github.com/FLB-Music/FLB-Music-Player"
license=('GPL3')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${pkgname%-bin}")
depends=('bash' 'electron13' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('811da0d45dfdbfb863b3a2d285083e419df6d2e03e5015b9ab6d19a6736d0477'
            '8c9b6e2ae8bdeca4a9c9635979007f776bd8183bc5c799c64a776fbaf1e026e8')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}