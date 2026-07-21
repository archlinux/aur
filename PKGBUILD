# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stoat-desktop-bin
_pkgname=Stoat
pkgver=1.4.2
_electronversion=40
pkgrel=1
pkgdesc="Stoat for Desktop. (Prebuilt version. Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://stoat.chat/"
_ghurl="https://github.com/stoatchat/for-desktop"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-assets::git+https://github.com/stoatchat/assets"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-arm64-${pkgver}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-x64-${pkgver}.zip")
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('96978237da20eb26f211a66ed81992337e4d49cb449457cde5134c87c2cbb0d7')
sha256sums_x86_64=('a380dd137607ff0eae3a9eab6e75b4b4fc0b04cd39ef02bc51ff8c304e99e7a9')
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
        --pkgdesc="Stoat for Desktop." \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/${pkgname%-bin}-assets/desktop/icon@3x.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
