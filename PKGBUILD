# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=darkwrite-bin
_pkgname=Darkwrite
pkgver=0.3.0_alpha.2
_electronversion=32
pkgrel=1
pkgdesc="The eye-candy note taking and to-do application for all desktops.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/astudentinearth/darkwrite"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-Linux-${pkgver//_/-}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('f6d9c3255fa49fb7d5e317feea39728659e07c04466d7adde958fa649129e998'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/@${pkgname%-bin}app-desktop/${pkgname%-bin}/g
    " -i "${srcdir}/squashfs-root/@${pkgname%-bin}app-desktop.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i "s/\.\.\/resources\/icon\.png/\.\.\/icon\.png/g" "${srcdir}/app.asar.unpacked/dist-electron/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/icon.png" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/@${pkgname%-bin}app-desktop.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/@${pkgname%-bin}app-desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
