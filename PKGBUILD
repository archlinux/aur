# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mubu-bin
_pkgname=Mubu
_zhsname='幕布'
pkgver=5.7.0
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
sha256sums=('4abc01aeec9cfa8061e802d299bea41679e00997839e0c6bd617d68ddc466f44'
            'dbc572392757c2abbb6d6d7ca62337561b46b8f3b403963a3624fa5a4884c4ec'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_check_electron_version() {
    local _app_dir=$(_get_app_dir)
    _elec_ver="$(strings "${_app_dir}/${_zhsname}.exe" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
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
    _check_electron_version
    local _app_dir=$(_get_app_dir)
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    find "${srcdir}/app.asar.unpacked" -type f -name "*.js" -exec sed -i "s/shortcut-logo.ico/logo.png/g" {} +
    find "${srcdir}/app.asar.unpacked/node_modules" -type d \( -name "android-arm*" -o -name "darwin-*" -o -name "linux-arm*" -o -name "win32-*" \) \
        -exec rm -rf {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    find "${_app_dir}/resources/app.asar.unpacked/node_modules" \
        -type d \( -name "android-arm*" -o -name "darwin-*" -o -name "linux-arm*" -o -name "win32-*" \) \
        -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${_app_dir}/resources/app.asar.unpacked/icon/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}