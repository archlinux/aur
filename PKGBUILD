# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=darkorbit-client-bin
_appname=DarkOrbit-Client
pkgver=2.8.0
pkgrel=2
pkgdesc="Open source darkorbit client (cross-platform and with better performance)"
arch=('x86_64')
url="https://github.com/kaiserdj/Darkorbit-client"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron11' 'hicolor-icon-theme' 'python' 'java-runtime' 'python-psutil' 'glibc' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('36a64931d244c0524ce36288c191916374957006a1be81cbcff1d000a027c315'
            '0ceb443283c950ad29bcf730dce6c746155c608552696655bc5699db45072dbe')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources/" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"{darkDev,flash} "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}