# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=musicfree-desktop
_appname=MusicFreeDesktop
pkgver=0.0.2
pkgrel=1
pkgdesc="插件化、定制化、无广告的免费音乐播放器"
arch=('x86_64')
url="http://musicfree.upup.fun/"
_githuburl="https://github.com/maotoumao/MusicFreeDesktop"
_pluginurl="https://gitee.com/maotoumao/MusicFreePlugins/raw/master/plugins.json"
license=('GPL3')
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron25'
    'libvips'
)
makedepends=(
    'gendesk'
    'npm>=8.19.4'
    'nodejs>=16.20.2'
)
source=(
    "${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh"
)
sha256sums=('8c84b648edfd07673df7173d7eb0599644ac1a5b42d33960f53c135751a0012c'
            'bd3152f0d47a8eb3951bc5c0207ead72d2998694e59ce8dd7f13797fdd83fe6f')
build() {
    gendesk -f -q -n --categories "AudioVideo" --name "${_appname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${_appname}-${pkgver}"
    if [ -d .git ];then
        rmdir .git
        mkdir .git
    else
        mkdir .git
    fi
    npm install
    npm run make
    cd "${srcdir}/${_appname}-${pkgver}/out/${_appname%Desktop}-linux-x64/resources"
    echo -e "\nprocess.env['ELECTRON_DISABLE_SECURITY_WARNINGS'] = 'true'" >> app/.webpack/main/index.js
    cp -r res app
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${_appname}-${pkgver//_/-}/out/${_appname%Desktop}-linux-x64/resources/"{app,res} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/res/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}