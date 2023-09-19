# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=laradumps-bin
_pkgname=LaraDumps
pkgver=2.3.2
pkgrel=1
pkgdesc="A friendly app designed to boost your Laravel PHP coding and debugging experience."
arch=('x86_64')
url="https://laradumps.dev/"
_githuburl="https://github.com/laradumps/app"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'electron25' 'bash')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/laradumps/app/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('c791ef70428f859918587ebaf3009b29bcd5b274d2f47d7d2224d37b6eeccba3'
            'f8bf03b56eb053128b56fffec88e14404cafd4a63bf1fcc39f90c672f5318650'
            '1d609c52385430b55cf4b4fbaaa6061e96d3b378f6a456d0f29c198fb52f5514')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|icon|#icon|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    chmod 755 "${srcdir}/squashfs-root/resources/build"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    cp -r "${srcdir}/squashfs-root/resources/build" "${pkgdir}/opt/${pkgname%-bin}/resources"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}