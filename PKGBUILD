# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=bonbon
pkgname="${_appname}-browser-bin"
_pkgname=BonBon
pkgver=1.0.1_early
_electronversion=22
pkgrel=1
pkgdesc="A lightweight and innovative browser.It makes you appreciate your browsing experience, and offers privacy. "
arch=('any')
url="https://bonbon.exchange/"
_ghurl="https://github.com/BonBon-exchange/bonbon-browser"
license=('GPL-3.0-only')
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
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('8c2b5e743a34c1ebcb83320b8db134a828a721475107ca101991e98cef464a77'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s|@electronversion@|${_electronversion}|g
        s|@appname@|${pkgname%-bin}|g
        s|@runname@|app|g
        s|@cfgdirname@|${_pkgname}|g
        s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g;s|Development|Development;Network|g" \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/dist" -type f -exec sed -i "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-git}\"|g" {} \;
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,assets,node_modules} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}