# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=glyphr-studio
_appname=Glyphr-Studio
pkgname="${_pkgname}-nativefier"
pkgver=1.13.21
_electronversion=25
pkgrel=1
pkgdesc="Glyphr Studio is a free, web based font designer."
arch=("x86_64")
url="http://glyphrstudio.com/"
_ghurl="https://github.com/glyphr-studio/Glyphr-Studio-1"
license=("GPL3")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'nodejs-nativefier'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --pkgname "${_pkgname}"  --categories "Utility" --icon "${_pkgname}.png" --name "${_appname}" --exec="${pkgname}"
    cp "${srcdir}/${pkgname}-${pkgver}/dist/${_appname//-/_}_-_${pkgver}.html" "${srcdir}/${_pkgname}-${pkgver}.html"
    cp "${srcdir}/${pkgname}-${pkgver}/${_pkgname//-/_}_logo.png" "${srcdir}/${_pkgname}.png"
    nativefier "file:///usr/lib/${pkgname}/${_pkgname}-${pkgver}.html" \
        --name "${_pkgname}" \
        --icon "${srcdir}/${_pkgname}.png" \
        --maximize \
        --user-agent chrome \
        --single-instance \
        --verbose
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.html" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
}