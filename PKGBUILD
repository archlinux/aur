# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mu-epub-viewer-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="Epub viewer on Electron that support text translation."
arch=('x86_64')
url="https://github.com/azu/mu-epub-reader"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron16' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/azu/mu-epub-reader/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('638b33189eda422f481464d4e6c81eb455192908f1cc35017dfc6b2f3e5f22b9'
            '8696e42debf4f04bd943baa459cfa5d17ef59407a1e9d3b705af1f9e56407c72'
            '789d97cbb39549333dd1b8cb44504e1befc77300b7e51ba92384018f949411ce')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/"* -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/opt/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/opt/${pkgname%-bin}/usr/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}