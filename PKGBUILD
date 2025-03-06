# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xiguavideo-bin
_zhsname='西瓜视频'
pkgver=1.1.1
_electronversion=20
pkgrel=1
pkgdesc="XiGua Video.(Prebuilt version.Use system-wide electron)西瓜视频Windows移植版,使用系统electron."
arch=('x86_64')
url="https://www.ixigua.com"
_dlurl="https://lf-xigua-pc.ixigua.com/obj/xigua-video-electron"
license=('LicenseRef-freeware')
provides=("${pkgname%-bin}")
conflicts=(
    "${pkgname%-bin}"
    "deepin-wine-${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'asar'
    'npm'
    'curl'
)
noextract=("${pkgname%-bin}-${pkgver}.exe")
source=(
    "${pkgname%-bin}-${pkgver}.exe::${_dlurl}/6922326164589517070/releases/12210441/${pkgver}/win32/xigua-video-${pkgver}-default.exe"
    LICENSE.html
    "${pkgname%-bin}.sh"
)
sha256sums=('6766ab8021b06b3a33028f580863f391b6503195358863d5b0c0258368a7ee61'
            'bd956769c0d43acd95075a4a95c2ffe5b31f404b4c8675c481e95d0307e82bf1'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_zhsname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_zhsname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/tmp"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.exe" -C "${srcdir}/tmp"
    asar e "${srcdir}/tmp/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cd "${srcdir}/app.asar.unpacked"
    sed '/tron-client/d' -i package.json
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
        } >> .npmrc
    fi
    NODE_ENV=development    npm install
    find dist -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/tmp/resources/"{edt,regedit} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/app.asar.unpacked/dist/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}