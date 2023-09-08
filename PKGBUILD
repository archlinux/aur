# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=thinreports-section-editor-bin
pkgver=1.0.0_dev
pkgrel=2
pkgdesc="A template editor for Thinreports to edit Section Format templates"
arch=('x86_64')
url="https://github.com/thinreports/thinreports"
_githuburl="https://github.com/thinreports/thinreports-section-editor"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron21' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-${pkgver//_/-}-linux-20221031-0b5119.AppImage"
    "LICENSE::https://raw.githubusercontent.com/thinreports/thinreports-section-editor/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('818e3b1fdf4fb1ed1fdbe47cc58a034074a652577a887b168edfb033f47b6aeb'
            '2d416fa05a32860094f618f477a982dd77676b236dc710f2a4df289b7e43ae0c'
            '658588bf0e8ddebb7e2010fd9f840811489ea33b86ded200a5b72df10ac913c8')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}