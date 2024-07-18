# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=tidgi
pkgname="${_pkgname}-desktop-bin"
_appname=TidGi
pkgver=0.10.3
_electronversion=31
pkgrel=1
pkgdesc="an privatcy-in-mind, automated, auto-git-backup, freely-deployed Tiddlywiki knowledge management Desktop note app, with local REST API."
arch=(
    'aarch64'
    'x86_64'
)
url="https://tidgi.fun/"
_ghurl="https://github.com/tiddly-gittly/TidGi-Desktop"
license=('MPL-2.0')
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
provides=(
    "${pkgname%-bin}=${pkgver}"
)
depends=(
    "electron${_electronversion}"
    'perl'
    'java-runtime'
    'nodejs'
)
makedepends=(
    'asar'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('f9fff37f8801c4a65f9432b0fc9eb3defe89682e1f73746406d1ec0e9efa6d9e')
sha256sums_x86_64=('4e4d64deb4346ca9b912905127d7ca44f1fa2c6ded361c98fb970e804dc5ef56')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_appname}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|${_pkgname} %U|${pkgname%-bin} %U|g" -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    asar e "${srcdir}/usr/lib/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-bin}\"|g" -i "${srcdir}/app.asar.unpacked/.webpack/main/index.js"
    sed "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-bin}\"|g" -i "${srcdir}/app.asar.unpacked/.webpack/main/98.index.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${_pkgname}/resources/"{app.asar.unpacked,localization,node_modules,wiki} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}