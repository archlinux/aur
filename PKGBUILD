# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-inventory-bin
_pkgname=Inventario
_appname=electron-vite-project
pkgver=1.0.1
_electronversion=26
pkgrel=6
pkgdesc="Simple desktop app to manage a wearhose inventory.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/osoyinas/simple-inventory"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-Linux-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('7c3eff2dc086aa6cab60fe1d8e44730c7e31a47e7b755bb25e5ab9336c06aa2f'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/${_appname}/${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_appname}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s/resources\/data/data/g" -i "${srcdir}/app.asar.unpacked/dist-electron/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/data/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/data"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}