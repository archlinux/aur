# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=polyglot
pkgname="${_pkgname}-ai-bin"
pkgver=0.3.5
pkgrel=2
pkgdesc="Based on ChatGPT and Azure artificial intelligence language models as underlying services, aiming to provide an easy-to-use language practice platform for multilingual speaking practice"
arch=("x86_64")
url="https://polyglotai.xyz/"
_ghurl="https://github.com/liou666/polyglot"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron23'
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname//p/P}_${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('13005a377d031ffc6c7227ebaed49c2d90b221e7eb15164ed0e45f0a29e42959'
            '34a6050f34261c5133d6c59a4f2f544dfc78acac404bebd9101b370695f555cc')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}