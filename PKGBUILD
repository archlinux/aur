# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goofcord-bin
_pkgname=GoofCord
pkgver=0.7.5
pkgrel=1
pkgdesc="Take control of your Discord experience with GoofCord – the highly configurable and privacy first discord client."
arch=('x86_64')
url="https://github.com/Milkshiift/GoofCord"
license=("custom::OSL3")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'bash'
    'electron26'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${CARCH}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Milkshiift/GoofCord/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('0b6dcf2577242582bbc0cc3f3251892866dfa4aea9f9be97de0dfa4e2c8cb8e0'
            '4e7f66aa93929feee2db20f14f871e7ddcc69236b0ecfb79a19ade9b859daf51'
            'aea4a3b6cf7aac399225798877e2c711426f971eb411fb604f44b08568a40802')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}