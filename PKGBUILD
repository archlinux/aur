# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=butterfly
pkgname="linwood-${_pkgname}-bin"
_appname="dev.linwood.${_pkgname}"
pkgver=2.0.0_rc.2
pkgrel=1
pkgdesc="Powerful, minimalistic, cross-platform, opensource note-taking app"
arch=("x86_64")
url="https://docs.butterfly.linwood.dev/"
_ghurl="https://github.com/LinwoodDev/Butterfly"
license=(
    'Apache'
    'AGPL3'
    'custom:CC-BY-4.0'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'cairo'
    'gtk3'
    'at-spi2-core'
    'libsecret'
    'libepoxy'
    'pango'
    'hicolor-icon-theme'
    'harfbuzz'
    'gdk-pixbuf2'
    'fontconfig'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/LinwoodDev/Butterfly/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('df8948d176465929b7f42b01394473b21e315a1590e5a10db8c40d0d3e3e41c0'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            '9e9ba4b38114c87487917f0440200d4ca10237769141228a4f59b3d2357d5bbf')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|${_pkgname} %f|${pkgname%-bin} %f|g;s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/bin/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_appname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}