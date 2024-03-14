# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=musicfree
pkgname="${_pkgname}-desktop-bin"
_appname=MusicFreeDesktop
pkgver=0.0.3
_electronversion=25
pkgrel=4
pkgdesc="插件化、定制化、无广告的免费音乐播放器"
arch=('x86_64')
url="http://musicfree.upup.fun/"
_ghurl="https://github.com/maotoumao/MusicFreeDesktop"
_pluginurl="https://gitee.com/maotoumao/MusicFreePlugins/raw/master/plugins.json"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}-bin"
    'nodejs'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_appname%Desktop}-${pkgver}-linux-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('49341709db01fae878cb1df11c7e90cb131fd830ce2ea0bf74c2d8d5890a8671'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|${_pkgname}|${pkgname%-bin}|g;s|Utility|AudioVideo|g" -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${_pkgname}/resources/"{app,res} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/res/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}