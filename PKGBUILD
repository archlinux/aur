# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="marvin-bin"
pkgver=0.4.9
pkgrel=1
pkgdesc="Open Source record and playback test automation for the web."
arch=('x86_64')
url="https://rolandbernard.github.io/marvin/"
_githuburl="https://github.com/rolandbernard/marvin"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('bash' 'electron24')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Marvin-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/rolandbernard/marvin/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('624a42d8d31d56bd9a3b82f4b6258ebffd9b5f5d623575b44b120f3646ae269e'
            '67cc90dae7113cf3572e7ae6b893b8e06960f696a6a1d3fc6b36b607cea970d6'
            '213e77f2af6e34b850b98efae7a87fd4fe87c5a2ab4ec7e133a4b0e6eeb6a321')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}