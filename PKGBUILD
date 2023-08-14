# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=laradumps-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="A friendly app designed to boost your Laravel PHP coding and debugging experience."
arch=('x86_64')
url="https://laradumps.dev/"
_githuburl="https://github.com/laradumps/app"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'electron25' 'bash')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/LaraDumps-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/laradumps/app/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('02cead248ad7216ac990f25afe79ddbf3e3bf87a0600f68b63b6ef34d2eeb809'
            '3150b483ca39a02e6651234966f2a19ba17486a87e8f26f9bdb7f4242e08af65'
            'e6e39f7dbd69a85dfb576773d758b64c9b0bb754b2fccecb1bd5d8b8bbecc78a')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|icon|#icon|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    chmod 755 "${pkgdir}/opt/${pkgname%-bin}/build"
}