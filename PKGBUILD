# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=musicfree
pkgname="${_pkgname}-desktop-bin"
_appname=MusicFreeDesktop
pkgver=0.0.8
_electronversion=25
pkgrel=2
pkgdesc="Plug-in, customized, ad-free music player.(Prebuilt version.Use system-wide electron)插件化、定制化、无广告的免费音乐播放器"
arch=('x86_64')
url="https://musicfree.catcat.work/"
_ghurl="https://github.com/maotoumao/MusicFreeDesktop"
_pluginurl="https://gitee.com/maotoumao/MusicFreePlugins/raw/master/plugins.json"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_appname%Desktop}-${pkgver}-linux-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('fb5a5c9307d76056870ec8b51a7213cbae0f1a3a5c25a9af84bf5c81e98aec7d'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/usr/lib/${_pkgname}/${_appname%Desktop}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}

prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_appname%Desktop}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i -e "
        s/${_pkgname}/${pkgname%-bin}/g
        s/Utility/AudioVideo/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    find "${srcdir}/usr/lib/${_pkgname}/resources/app/.webpack" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_pkgname}/resources/"{app,res} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/res/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
