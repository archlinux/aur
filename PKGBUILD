# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=butterfly
pkgname="linwood-${_pkgname}-bin"
_appname="dev.linwood.${_pkgname}"
pkgver=2.2.1
pkgrel=1
pkgdesc="Powerful, minimalistic, cross-platform, opensource note-taking app.Prebuilt version."
arch=("x86_64")
url="https://docs.butterfly.linwood.dev/"
_ghurl="https://github.com/LinwoodDev/Butterfly"
license=(
    'AGPL-3.0-only'
    'CC-BY-4.0'
    'Apache-2.0'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'at-spi2-core'
    'libsecret'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${CARCH}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/LinwoodDev/Butterfly/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('f0bd75e0c954d79b54611de4ca2eaf4c6efd121a4df1667ff9706e0dda482fec'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/${_pkgname} %f/${pkgname%-bin} %f/g;s/${_appname}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/usr/share/mime/packages/${_appname}.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/bin/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_appname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}