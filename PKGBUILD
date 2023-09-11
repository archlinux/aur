# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=astrofox-bin
_pkgname=Astrofox
pkgver=1.4.0
pkgrel=3
pkgdesc="A motion graphics program that lets you turn audio into amazing videos."
arch=('x86_64')
url="https://astrofox.io"
_githuburl="https://github.com/astrofox-io/astrofox"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron16')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.AppImage::https://files.astrofox.io/download/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/astrofox-io/astrofox/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('05327ea2944741d8bab8ef5f8bfd33530fbbb72ad85b6e4c411714c6fd295b65'
            '2366e943e400fbf8d55651d8f29257f7a680ce6fcb428d0215e75362f8728e43'
            'fdcd8d5d6971074ea2a96c472107ab18729fce230eab201f50d4cab60a617e08')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp "${srcdir}/squashfs-root/resources/app-update.yml" "${srcdir}/app.asar.unpacked/dev-app-update.yml"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    chmod 755 "${srcdir}/squashfs-root/resources/bin"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/bin" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}