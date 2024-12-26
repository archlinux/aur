# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=musicfree
pkgname="${_pkgname}-desktop-bin"
_appname=MusicFreeDesktop
pkgver=0.0.6
_electronversion=25
pkgrel=1
pkgdesc="Plug-in, customized, ad-free music player.(Prebuilt version.Use system-wide electron)插件化、定制化、无广告的免费音乐播放器"
arch=('x86_64')
url="http://musicfree.upup.fun/"
_ghurl="https://github.com/maotoumao/MusicFreeDesktop"
_pluginurl="https://gitee.com/maotoumao/MusicFreePlugins/raw/master/plugins.json"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_appname%Desktop}-${pkgver}-linux-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('cb65dfa5f51ff5c9a987272b376a4ac080ff4faf641333420bceae6c2f451f5c'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_appname%Desktop}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/${_pkgname}/${pkgname%-bin}/g
        s/Utility/AudioVideo/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    find "${srcdir}/usr/lib/${_pkgname}/resources/app/.webpack" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_pkgname}/resources/"{app,res} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/res/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}