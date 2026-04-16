# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mubu-bin
_pkgname=Mubu
_zhsname='幕布'
pkgver=5.5.0
_electronversion=32
pkgrel=1
pkgdesc="A mind management tool that combines outline notes and mind maps.(Prebuilt version.Use system-wide electron)一款结合了大纲笔记和思维导图的头脑管理工具(packed from origin exe)"
arch=('x86_64')
url="https://mubu.com"
license=('LicenseRef-mubu')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    '7zip'
    'gendesk'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.exe::https://assets.mubu.com/client/${pkgver}/win/${_pkgname}-${pkgver}-x64.exe"
    "LICENSE-${pkgver}.html::${url}/agreement"
    "${pkgname%-bin}.sh"
)
sha256sums=('0c3c43d65d244d69c273ec2cae102d7f4e0f518da8a24426f88f466b782fc521'
            'dbc572392757c2abbb6d6d7ca62337561b46b8f3b403963a3624fa5a4884c4ec'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/tmp/${_zhsname}.exe" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}\/${pkgname%-bin}_app_data/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Office" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U" \
        --custom="Name[zh_CN]=${_zhsname}"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.exe"
    install -Dm755 -d "${srcdir}/tmp"
    7z x -aoa "${srcdir}/\$PLUGINSDIR/app-64.7z" -o"${srcdir}/tmp"
    _get_electron_version
    asar e "${srcdir}/tmp/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/tmp/resources/app.asar"
    find "${srcdir}/app.asar.unpacked" -type f -name "*.js" -exec sed -i "s/shortcut-logo.ico/logo.png/g" {} +
    find "${srcdir}/app.asar.unpacked/node_modules" -type d \( -name "android-arm*" -o -name "darwin-*" -o -name "linux-arm*" -o -name "win32-*" \) \
        -exec rm -rf {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/tmp/resources/app.asar"
    find "${srcdir}/tmp/resources/app.asar.unpacked/node_modules" -type d \( -name "android-arm*" -o -name "darwin-*" -o -name "linux-arm*" -o -name "win32-*" \) \
        -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/tmp/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/tmp/resources/app.asar.unpacked/icon/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
