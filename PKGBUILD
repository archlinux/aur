# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lyricistant-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="A helpful writing assistant for lyricists!"
arch=('aarch64' 'x86_64')
url="https://github.com/wardellbagby/lyricistant"
license=('GPL3')
depends=('electron' 'hicolor-icon-theme')
conflicts=("${pkgname%-bin}")
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux_arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux_x86_64.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('4ab50fa1f95feb88249477630af8c2db71bb2c1973a2b5ffd8cb1f7d27db065a')
sha256sums_aarch64=('dd9e673bdb078c0dc488543b4978a8284e7eabbef04b66737db48d206e6a1143')
sha256sums_x86_64=('21cfd0cffafb1e790c93edf903afc0135eb71663ab6df8b9e6d423739eb07988')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
} 
package() {
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}