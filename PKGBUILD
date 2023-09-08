# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tesler-bin
_pkgname=TesLEr
pkgver=0.2.3
pkgrel=2
pkgdesc="TesLEr - The Tesla Sentinel Viewer"
arch=('x86_64')
url="https://github.com/j-catania/TeslaSentinelViewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/TesLEr-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/j-catania/TeslaSentinelViewer/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('5447e01520ad757fdbb4130e764a863c9d282c5dd48cf2fabbd33e171a2decfd'
            '29eee3e9d9c5dd67213ec3ab4a7eef57a1224750e2e9aab3a278177a9444a355'
            'f487f4e4cdf98a80bc0634c5f6852e7b50de2002d22178657640b3e0563d10c0')
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