# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tishare-desktop-bin
_pkgname=tiShare
pkgver=0.4.0
_electronversion=26
pkgrel=2
pkgdesc="tiShare aims to send files or folders between devices easily, with cross-platform support."
arch=('x86_64')
url="https://github.com/dlguswo333/tishare-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname%}-${pkgver}.AppImage"
    "index-${pkgver}.html::https://raw.githubusercontent.com/dlguswo333/tishare-desktop/v${pkgver}/src/front/index.html"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/dlguswo333/tishare-desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('0df6c5896536151b3ac2538435ac673f46a50078b6886fd98e4b1e29ea56c39c'
            'a9db662637dcb2f531e9d9078fa90a70ea9e3d8f48bdd499e30993ad6c0ce228'
            '5461c88ddb4ff9c0e56d75fdb18fe2719a5afe1c676513496a2e07b45ccebb99'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    install -Dm644 "${srcdir}/index-${pkgver}.html" "${srcdir}/app.asar.unpacked/build/index.html"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}//LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}