# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=shutu_client
pkgname="${_appname//_/-}-bin"
_pkgname=ShuTu
_enname=TreeMind
_zhsname="树图思维导图"
pkgver=1.0.7
_electronversion=21
pkgrel=1
pkgdesc="A new generation of 'AI intelligence' mind map.新一代'AI智能'思维导图"
arch=('x86_64')
url="https://shutu.cn"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}-bin"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://static.shutu.cn/client/download/ShuTu-Linux-${pkgver}.deb"
    "LICENSE-user.html::${url}/user-agreement.html"
    "LICENSE-privacy.html::${url}/privacy.html"
    "LICENSE-upload.html::${url}/upload.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('923bd86ab825a23aa31e0b8aaf04f56a3fd427c23f8f78a6fe31b9cf1eae30f3'
            'f177bc56d0d6f2b18128a67f1aa080f1708f48e0ac92ea985383f1896f23bd73'
            '366f721da89ec312cb4917a4596544a7945df77e9a677103e06d0e84f73a4168'
            'bce7b2ffb9a99535c7ede2122a9c078226affd95f2cfe4e9831c8f79586429a3'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|\"/opt/${_zhsname}/${_appname}\"|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -e "s|Name=|Name[zh_CN]=|g;s|Comment=${_zhsname}|Comment=${pkgdesc}|g;2i\Name=${_enname}" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-"*.html -t "${pkgdir}/usr/share/licenses/${pkgname}"
}