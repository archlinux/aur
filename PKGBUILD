# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=wenku
pkgname="baidu${_pkgname}-bin"
_zhsname="百度文库"
pkgver=2.0.2
_electronversion=22
pkgrel=1
pkgdesc="Baidu wenku Client.一款由百度发布的供网友在线分享文档的平台"
arch=('x86_64')
url="https://wenku.baidu.com"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "deepin-wine-${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'p7zip'
    'npm'
    'asar'
    'gendesk'
    'curl'
)
source=(
    "${pkgname%-bin}-${pkgver}.exe::https://edu-wenku.bdimg.com/v1/na/0807/PC%E5%AE%A2%E6%88%B7%E7%AB%AF%E7%89%88%E6%9C%AC%E5%8C%85/%E7%99%BE%E5%BA%A6%E6%96%87%E5%BA%93%20Setup%20${pkgver}.exe"
    "LICENSE.html::https://edu-wenku.bdimg.com/v1/pc/protocols/help24-new.htm"
    "${pkgname%-bin}.sh"
)
sha256sums=('866d5192cd751d39c41d3a26464ae217954d4cef7c83a68aa194267c6a78ee30'
            'eb85aa9b3586dcd16b0f18b4b467b46b076688f9d1f723dea7f2eb92cd797ce7'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}-pc|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Office" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
    sed "3i\Name[zh_CN]=${_zhsname}" -i "${srcdir}/${pkgname%-bin}.desktop"
    rm -rf "${srcdir}/tmp"
    install -Dm755 -d "${srcdir}/tmp"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.exe" -o"${srcdir}/tmp"
    rm -rf "${srcdir}/app.asar.unpacked"
    asar e "${srcdir}/tmp/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cd "${srcdir}/app.asar.unpacked"
    rm -rf node_modules/sqlite3
    export npm_config_cache="${srcdir}/.npm_cache"
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
    else
        echo "Your network is OK."
    fi
    npm add sqlite3
    cd "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/app.asar.unpacked/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}