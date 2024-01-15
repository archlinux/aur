# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=antares
pkgname="${_pkgname}-sql-bin"
_appname=Antares
pkgver=0.7.21
_electronversion=22
pkgrel=1
pkgdesc="A modern, fast and productivity driven SQL client with a focus in UX."
arch=("aarch64" "armv7h" "x86_64")
url="https://antares-sql.app/"
_ghurl="https://github.com/antares-sql/antares"
license=("MIT")
depends=(
    'hicolor-icon-theme'
    "electron${_electronversion}"
)
makedepends=('asar')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/antares-sql/antares/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('7b960bb0bed7d2228b6a8a879558c97906cc041ab14ab1d1089959902f386613'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
sha256sums_aarch64=('3d819dec84b94ef2914fd5e56263576055c53bd29a58d499d59cbfbb31a06b5f')
sha256sums_armv7h=('5657abae22d4c8aa9a2f8432cec0a17c5bfc69c10528298f1af647a49d8468a4')
sha256sums_x86_64=('ab9424b4461221aed2295ae6ce73fa77fd9d91f36a32de84101f554eb3746f2f')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_appname}/${_pkgname}|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {    
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}