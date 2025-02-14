# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=botgem-bin
_pkgname=BotGem
pkgver=1.5.1
_electronversion=22
pkgrel=2
pkgdesc="Your Al-Powered Toolbox for Tomorrow.Prebuilt version.Use system-wide electron."
arch=('x86_64')
url="https://botgem.com/"
_ghurl="https://github.com/gaodeng/ama-discussions"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.appx::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.${pkgver}.appx"
    "sqlite3-x86_64.tar.gz::https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.7/sqlite3-v5.1.7-napi-v6-linux-x64.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('2c2caaeac6642f2c4cecaccb6915cce3174a47431605c05fd565a6acf764409c'
            '6d1f7a95e5aca90db1fd6a2839380a021d5ee23d46f2d7c520ded094da813fed'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/com.${pkgname}.ama/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Office" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    asar e "${srcdir}/app/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/dist" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    install -Dm644 "${srcdir}/build/Release/node_sqlite3.node" -t "${srcdir}/app.asar.unpacked/node_modules/sqlite3/build/Release"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/build/Release/node_sqlite3.node" -t "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar.unpacked/node_modules/sqlite3/build/Release"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/app/resources/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/app.asar.unpacked/dist/main/main.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}