# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=excel-parser-processor-bin
_appname=Excel-Parser-Processor
pkgver=1.3.1
pkgrel=5
pkgdesc="Simply generates an array of items from the rows of an Excel file and does the repetitive tedious operations step by step recursively till every item of the array is processed."
arch=('x86_64')
url="https://github.com/btargac/excel-parser-processor"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'electron13'
    'hicolor-icon-theme'
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/btargac/excel-parser-processor/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('90b96fec41aae2dffdd5a7c72dfdd8ad954b2675662a4dc4360851410aa73b5d'
            'cb199ba111f4311de39df0fc7458a8573f9c62f42eb2332b4262f0e6b31a3ff7'
            '50edd435b99fbbf512951cc5461694cb1818d39306336e98125be79352d7daf3')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}