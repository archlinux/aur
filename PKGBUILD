# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=video-hub-app-bin
_pkgname=Video.Hub.App
pkgver=3.2.0
_electronversion=22
pkgrel=7
pkgdesc="The fastest way to browse and search for videos on your computer. Think of it like YouTube for videos on your computer: browse, search, and preview."
arch=('x86_64')
url="https://videohubapp.com/"
_ghurl="https://github.com/whyboris/Video-Hub-App"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.3.Demo-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/whyboris/Video-Hub-App/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5264acfd9d4e3ca0ce7332acaeb74431c49b48e9f50f01bd9f45074ea323577b'
            '096d751c3b4fea8ec7f2c8600137020ac6d1ab74b27a6353d1a3dca4271bc9f0'
            '61d56055897e9d71d68e185ac2de7c4cb2fbca16eb3fb0091703612c113441f3')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|${pkgname%-bin}-3|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}-3.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"{assets,app.asar.unpacked,remote} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}-3.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}-3.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}