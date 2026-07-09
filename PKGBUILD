# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=boxplayer-bin
_pkgname=BoxPlayer
pkgver=5.0.0
_electronversion=21
pkgrel=1
pkgdesc="Unified cloud drive management, smart media library, media servers, and high-speed downloads.(Prebuilt version.Use system-wide electron)小白羊网盘 BoxPlayer - 多网盘统一管理 + 智能媒体库 + 媒体服务器 + 高速下载."
arch=(
    'aarch64'
    'x86_64'
)
url="https://xbyvideohub.com/"
_ghurl="https://github.com/gaozhangmin/boxplayer"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'aria2'
    'nodejs'
)
makedepends=(
    'asar'
)
options=(
    '!emptydirs'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.pacman")
sha256sums=('a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('33010e965166945fcc66b9929826921a5f4dcbc2ae1d069fda371313313fd22a')
sha256sums_x86_64=('eeb908cacb031249ab2ff3f55c5f4dfbbf061a7ac1713549e42f39e90d56f7e0')
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
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    local _app_dir=$(_get_app_dir)
    ln -sf "/usr/bin/aria2c" "${_app_dir}/resources/engine/aria2c"
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    find "${srcdir}/app.asar.unpacked/dist" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}/usr/share/icons" -type f \( -name "*.png" -o -name "*.svg" \) \
        | while read -r _i; do
        _extension="${_i##*.}"
        _target_dir=$(dirname "${_i#$srcdir}")
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
