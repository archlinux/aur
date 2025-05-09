# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tishare-desktop-bin
_pkgname=tiShare
pkgver=0.5.1
_electronversion=33
pkgrel=2
pkgdesc="tiShare aims to send files or folders between devices easily, with cross-platform support.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://dlguswo333.github.io/tishare-docs"
_ghurl="https://github.com/dlguswo333/tishare-desktop"
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
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname%}-${pkgver}.AppImage"
    "index-${pkgver}.html::https://raw.githubusercontent.com/dlguswo333/tishare-desktop/v${pkgver}/src/front/index.html"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/dlguswo333/tishare-desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('ceee6de95439d194113f9185c248941bc1a0b047a5d547fa0b3cac6e19b87733'
            'a9db662637dcb2f531e9d9078fa90a70ea9e3d8f48bdd499e30993ad6c0ce228'
            '5461c88ddb4ff9c0e56d75fdb18fe2719a5afe1c676513496a2e07b45ccebb99'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
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