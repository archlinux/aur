# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jm-desktop-bin
pkgver=2.2.0
_electronversion=42
pkgrel=1
pkgdesc="A jm comic desktop app by react + electron.(Prebuilt version).一个禁漫的第三方客户端"
arch=('x86_64')
url="https://github.com/Dedicatus546/jm-desktop"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-Linux-x64-${pkgver}.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('6d84cbc67ffdfa0c0544586c8f4c6846e52ac642281d95994a5eee551c65b0b3'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_check_electron_version() {
    echo "Verifying Electron version..."
    local _main_exe=$(find "$(_get_app_dir)" -maxdepth 1 -type f -executable -printf '%s %p\n' | sort -nr | head -1 | cut -d' ' -f2-)
    [[ -z "${_main_exe}" ]] && echo -e "\033[1;33mNote: Could not find Electron binary.\033[0m" && return
    local _elec_ver=$(strings "${_main_exe}" | grep -oP 'Electron/\K[0-9]+' | head -1)
    [[ -z "${_elec_ver}" ]] && echo -e "\033[1;33mNote: Could not determine Electron version.\033[0m" && return
    [[ "${_elec_ver}" != "${_electronversion}" ]] &&
        echo -e "\033[1;31mWarning: Electron version mismatch! Detected: ${_elec_ver}, Expected: ${_electronversion}\033[0m" ||
        echo -e "Electron version verified: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin} %U"
    local _app_dir=$(_get_app_dir)
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    sed -i -e "
        s/pi.getPath(\"exe\")/\'\/usr\/lib\/${pkgname%-bin}\/${pkgname%-bin}\'/g
        s/ti.getPath(\"exe\")/\'\/usr\/lib\/${pkgname%-bin}\/${pkgname%-bin}\'/g
        s/o.getPath(\"exe\")/\'\/usr\/lib\/${pkgname%-bin}\/${pkgname%-bin}\'/g
    " "${srcdir}/app.asar.unpacked/dist-electron/main.js"
    asar p  "${srcdir}/app.asar.unpacked"  "${_app_dir}/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/app.asar.unpacked/dist/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/data"
    chown -R "${USER}:${USED}" "${pkgdir}/usr/lib/${pkgname%-bin}/data"
}
