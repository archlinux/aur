# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=glyphr-studio
_appname=Glyphr-Studio
pkgname="${_pkgname}-nativefier"
pkgver=1.13.20
pkgrel=1
pkgdesc="Glyphr Studio is a free, web based font designer."
arch=("x86_64")
url="http://glyphrstudio.com/"
_githuburl="https://github.com/glyphr-studio/Glyphr-Studio-1"
license=("GPL3")
_electron=26
depends=("electron${_electron}")
makedepends=('gendesk' 'yarn' 'asar')
source=("${_pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${_pkgname}.sh")
sha256sums=('f8e4f1711969083b5031d2d678c47bc69c3d62af400c5019b474d92e4118d52a'
            '7f16548a9032e868617f1d70ec6cd3a11c111d3055da5ede01b57ee1a5f64148')
build() {
    yarn add nativefier
    cp "${srcdir}/${_appname}-1-${pkgver}/dist/${_appname//-/_}_-_${pkgver}.html" "${srcdir}/${_pkgname}-${pkgver}.html"
    cp "${srcdir}/${_appname}-1-${pkgver}/${_pkgname//-/_}_logo.png" "${srcdir}/${_pkgname}.png"
    yarn nativefier "file:///opt/${_pkgname}/${_pkgname}-${pkgver}.html" \
        --name "${_pkgname}" \
        --icon "${_pkgname}.png" \
        --maximize \
        --user-agent chrome \
        --single-instance \
        -e "22.3.3" \
        --verbose
    asar pack "${srcdir}/${_pkgname}-linux-x64/resources/app" "${srcdir}/${_pkgname}.asar"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.html" -t "${pkgdir}/opt/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.asar" -t "${pkgdir}/opt/${_pkgname}"
    gendesk -f -n --pkgname="glyphr-studio"  --categories "Utility" --icon "${_pkgname}.png" --name "${_appname}" --exec="${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
}