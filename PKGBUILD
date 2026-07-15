# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=affine-bin
_pkgname=AFFiNE
pkgver=0.27.0
_electronversion=39
pkgrel=1
pkgdesc="There can be more than Notion and Miro.AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://affine.pro/"
_ghurl="https://github.com/toeverything/AFFiNE"
license=(
    'LicenseRef-custom'
    'MIT'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-stable-linux-x64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver}/LICENSE"
    "LICENSE-MIT-${pkgver}::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver}/LICENSE-MIT"
    "${pkgname%-bin}.sh"
)
sha256sums=('f97a678e62932982af5dcf8dfb400bf9f8b09fb4603160ac9ec92514ec52cd72'
            'c107c8088fe42bce6def95d313cfe7b5984d3bb2c1608b67f855327da45f497b'
            '1cdeca52d4f740361f103926144eb8b3f265975b2337d4e27b3313f72465897f'
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
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/${pkgname%-bin}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
}
