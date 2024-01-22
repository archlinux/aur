# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=amethyst
pkgname="${_pkgname}-player-bin"
_appname=Amethyst
pkgver=1.9.16
_electronversion=24
pkgrel=2
pkgdesc="A cross-platform music player made with Typescript"
arch=(
    "aarch64"
    "x86_64"
)
url="https://amethyst.pages.dev/"
_ghurl="https://github.com/Geoxor/Amethyst"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Geoxor/Amethyst/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('80d12b7c086562e81c66238a2b7c596c335a4da2a047f9880c39ee03b85c28bb'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
sha256sums_aarch64=('01927aaf04d31e5249e06933e1c78fc624112f034add2f0a3e7767e908dfc52a')
sha256sums_x86_64=('2d90947460494f3ba346109d5101b1fbb3c12010fbfd098526f31ba81bc1f1e1')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_appname}/${_pkgname}|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g;s|Music;|AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}