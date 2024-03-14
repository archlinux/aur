# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=glyphr-studio
_appname=Glyphr-Studio
pkgname="${_pkgname}-nativefier"
pkgver=1.14.0
_electronversion=25
pkgrel=3
pkgdesc="Glyphr Studio is a free, web based font designer."
arch=("x86_64")
url="http://glyphrstudio.com/"
_ghurl="https://github.com/glyphr-studio/Glyphr-Studio-1"
license=("GPL-3.0-only")
depends=(
    "electron${_electronversion}-bin"
)
makedepends=(
    'gendesk'
    'nodejs-nativefier'
    'git'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --pkgname="${_pkgname}"  --categories="Utility" --icon="${_pkgname}.png" --name="${_appname}" --exec="${pkgname} %U"
    cp "${srcdir}/${pkgname}.git/dist/${_appname//-/_}_-_${pkgver}.html" "${srcdir}/${_pkgname}.git.html"
    cp "${srcdir}/${pkgname}.git/${_pkgname//-/_}_logo.png" "${srcdir}/${_pkgname}.png"
    nativefier "file:///usr/lib/${pkgname}/${_pkgname}.git.html" \
        --name "${_pkgname}" \
        --icon "${srcdir}/${_pkgname}.png" \
        --maximize \
        --user-agent chrome \
        --single-instance \
        --verbose
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.git.html" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
}