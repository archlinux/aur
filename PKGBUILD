# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="excel-parser-processor-bin"
pkgver=1.3.1
pkgrel=1
pkgdesc="Simply generates an array of items from the rows of an Excel file and does the repetitive tedious operations step by step recursively till every item of the array is processed."
arch=('x86_64')
url="https://github.com/btargac/excel-parser-processor"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron25' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Excel-Parser-Processor-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/btargac/excel-parser-processor/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('90b96fec41aae2dffdd5a7c72dfdd8ad954b2675662a4dc4360851410aa73b5d'
            'cb199ba111f4311de39df0fc7458a8573f9c62f42eb2332b4262f0e6b31a3ff7'
            '31587f1616cc148c6c22220939b5af6fae5d36884127a4bc4b6d36461c48d2db')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}