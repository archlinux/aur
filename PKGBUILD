# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=musicfree-desktop
_appname=MusicFreeDesktop
pkgver=0.0.0_alpha.0
pkgrel=3
pkgdesc="插件化、定制化、无广告的免费音乐播放器"
arch=('x86_64')
url="http://musicfree.upup.fun/"
_githuburl="https://github.com/maotoumao/MusicFreeDesktop"
_pluginurl="https://gitee.com/maotoumao/MusicFreePlugins/raw/master/plugins.json"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron25')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/v${pkgver//_/-}.zip"
    "${pkgname}.sh")
sha256sums=('ea485091ecdfb9ba9fa3f52e00aca77fdb0f5ffa0aa5d8c043cc9ba3299b6739'
            '8303386ca40c67ade06e1faa773d8c4ff40bbf9acb46d576b07e4570a0a94c7d')
build() {
    gendesk -f -q -n --categories "AudioVideo" --name "${_appname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${_appname}-${pkgver//_/-}"
    if [ -d .git ];then
        rmdir .git
        mkdir .git
    else
        mkdir .git
    fi
    npm install
    npm run package
    cd "${srcdir}/${_appname}-${pkgver//_/-}/out/${_appname%Desktop}-linux-x64/resources"
    echo -e "\nprocess.env['ELECTRON_DISABLE_SECURITY_WARNINGS'] = 'true'" >> app/.webpack/main/index.js
    cp -r res app
    asar p app "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_appname}-${pkgver//_/-}/res/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}