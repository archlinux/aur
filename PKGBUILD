# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bdash-bin
_pkgname=Bdash
pkgver=1.16.2
pkgrel=4
pkgdesc="Simple SQL Client for lightweight data analysis."
arch=('x86_64')
url="https://github.com/bdash-app/bdash"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron12' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/bdash-app/bdash/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('386255544582fd8416e7be3e074ce5f58cbac0f76b252aa5b2cb4d133843d814'
            '44e997a14d296ed01f24a68d2071280936534e98f4613fa8b875c9922e6b22d8'
            '70697d9480ae77efc8a7fe0ac6398e1512d2dc96ba90859d7affe5cbd1e532c4')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/resources/build/icon.png" -t "${pkgdir}/opt/${pkgname%-bin}/build"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}