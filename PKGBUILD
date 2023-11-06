# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=musicfree
pkgname="${_pkgname}-desktop-bin"
_appname=MusicFreeDesktop
pkgver=0.0.2
pkgrel=1
pkgdesc="插件化、定制化、无广告的免费音乐播放器"
arch=('x86_64')
url="http://musicfree.upup.fun/"
_githuburl="https://github.com/maotoumao/MusicFreeDesktop"
_pluginurl="https://gitee.com/maotoumao/MusicFreePlugins/raw/master/plugins.json"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'bash'
    'electron25'
    'libvips'
)
source=(
    "${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_appname%Desktop}-${pkgver}-linux-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('5a7f6e5e51b4fc61ef511c98e2a45998c7d2e8d1d0a26a1c47b2d87cfb86afbb'
            'bd3152f0d47a8eb3951bc5c0207ead72d2998694e59ce8dd7f13797fdd83fe6f')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    cd "${srcdir}/usr/lib/${_pkgname}/resources"
    cp -r res app
    echo -e "\nprocess.env['ELECTRON_DISABLE_SECURITY_WARNINGS'] = 'true'" >> app/.webpack/main/index.js
    sed "s|${_pkgname}|${pkgname%-bin}|g;s| %U||g;s|Utility|AudioVideo|g" -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}