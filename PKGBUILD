# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=glyphr-studio
_appname=Glyphr-Studio
pkgname="${_pkgname}-nativefier"
pkgver=1.13.20
pkgrel=2
pkgdesc="Glyphr Studio is a free, web based font designer."
arch=("x86_64")
url="http://glyphrstudio.com/"
_ghurl="https://github.com/glyphr-studio/Glyphr-Studio-1"
license=("GPL3")
depends=(
    "electron26"
)
makedepends=(
    'gendesk'
    'nodejs-nativefier'
)
source=(
    "${_pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${_pkgname}.sh"
)
sha256sums=('f8e4f1711969083b5031d2d678c47bc69c3d62af400c5019b474d92e4118d52a'
            '0edfffbfc40a55cf79c814ada39dfeeb9b3a724736e90607a5f8a3b71140a88e')
build() {
    gendesk -q -f -n --pkgname="glyphr-studio"  --categories "Utility" --icon "${_pkgname}.png" --name "${_appname}" --exec="${_pkgname}"
    cp "${srcdir}/${_appname}-1-${pkgver}/dist/${_appname//-/_}_-_${pkgver}.html" "${srcdir}/${_pkgname}-${pkgver}.html"
    cp "${srcdir}/${_appname}-1-${pkgver}/${_pkgname//-/_}_logo.png" "${srcdir}/${_pkgname}.png"
    nativefier "file:///usr/lib/${_pkgname}/${_pkgname}-${pkgver}.html" \
        --name "${_pkgname}" \
        --icon "${srcdir}/${_pkgname}.png" \
        --maximize \
        --user-agent chrome \
        --single-instance \
        --verbose
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.html" -t "${pkgdir}/usr/lib/${_pkgname}"
    cp -r "${srcdir}/${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
}