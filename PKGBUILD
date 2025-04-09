# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nuclia-bin
_pkgname=NucliaDesktop
pkgver=2.7.9
_electronversion=29
pkgrel=4
pkgdesc="A low-code API to build an AI & multi-language semantic search engine in minutes. For any data, including audios and videos, and any source.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://nuclia.com/"
_ghurl="https://github.com/nuclia/frontend"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/nuclia/frontend/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('7da0463945cae542716aa1bc46719397b01dffae329c31543e7207da0cebd817'
            '7c18093059eeabbeac27a86cb0c7e187845d96331e9c5d8388ee8fc5d637da66'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}