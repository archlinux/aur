# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=glyphr-studio
_appname=Glyphr-Studio
pkgname="${_pkgname}-nativefier"
pkgver=1.14.0
_electronversion=25
pkgrel=4
pkgdesc="Glyphr Studio is a free, web based font designer."
arch=("any")
url="http://glyphrstudio.com/"
_ghurl="https://github.com/glyphr-studio/Glyphr-Studio-1"
license=("GPL-3.0-only")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'nodejs-nativefier'
    'curl'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('823d3dabdfb2e37b27ce1fd67a646cba9512d466d79d2d567bc24b8d2eea93e0'
            '41b6d61dffef064762b3eec3dfeca7a3e1f57cbcb6dce9a6940c06797a0eae9d')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --pkgname="${_pkgname}"  --categories="Utility" --icon="${_pkgname}.png" --name="${_appname}" --exec="${pkgname} %U"
    cp "${srcdir}/${_appname}-1-${pkgver}/dist/${_appname//-/_}_-_${pkgver}.html" "${srcdir}/${_pkgname}-${pkgver}.html"
    cp "${srcdir}/${_appname}-1-${pkgver}/${_pkgname//-/_}_logo.png" "${srcdir}/${_pkgname}.png"
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
    cp -r "${srcdir}/${_pkgname}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
}