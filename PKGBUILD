# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=trilium
pkgname="${_appname}next-bin"
_pkgname="TriliumNext Notes"
pkgver=0.90.8
_electronversion=31
pkgrel=1
pkgdesc="Build your personal knowledge base with TriliumNext Notes.Prebuilt version.Use system-wide electron."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/TriliumNext/Notes"
license=("AGPL-3.0-only")
provides=(
    "${_appname}"
    "${pkgname%-bin}=${pkgver}"
)
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
    "${_appname}-cn"
)
depends=(
    "electron${_electronversion}"
    'nodejs'
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname// /}-v${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname// /}-v${pkgver}-linux-x64.deb")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('1b98162ee02226788b82e1853c5d83aaef95ebb6d1d2b6d0841ab4bded424138')
sha256sums_x86_64=('79b651de9d5fb802b7a8acd37403ab479a2e59950e86a256419365810439ad74')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_appname}/resources/"{app.asar.unpacked,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_appname}/dump-db" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/doc/${_appname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}