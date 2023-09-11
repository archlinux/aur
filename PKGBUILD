# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=board4you-bin
pkgver=1.0.6
pkgrel=4
pkgdesc="A whiteboard app built with Electron, React, react-icons, konva and bootstrap."
arch=("x86_64")
url="https://github.com/GachiLord/board4you"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23')
makdepends=('asar')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('1aef780b30d0e45e460046c0c91119be5243918d027b98553a64a384604c9829'
            'b5ed4601ec63b24f48da953c467131c29fb33314ba8df1eed7f50e7bfb108d05')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}