# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flb-music-player-bin
_pkgname=flbmusic
pkgver=1.2.1
pkgrel=1
pkgdesc="A beautiful Feature Rich Music Player and Downloader,cross platform"
arch=('x86_64')
url="https://flbmusic.xyz/"
_githuburl="https://github.com/FLB-Music/FLB-Music-Player"
license=('GPL3')
conflicts=("${_pkgname}" "${pkgname%-bin}")
provides=("${_pkgname}")
depends=('electron13' 'hicolor-icon-theme' 'bash')
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/FLB-Music-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('811da0d45dfdbfb863b3a2d285083e419df6d2e03e5015b9ab6d19a6736d0477'
            'd1567a8c6bfd3ac1f8e3515a84a2d1de0d6716b889c059799979ceafc06ef66f')
prepare() {
    chmod a+x "${srcdir}/${_pkgname}-${pkgver}.AppImage"
    "${srcdir}/${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
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