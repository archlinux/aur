# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=postybirb-bin
_pkgname=PostyBirb
pkgver=4.0.43
_electronversion=41
pkgrel=1
pkgdesc="An application that helps artists post art and other multimedia to multiple websites more quickly.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.postybirb.com/"
_ghurl="https://github.com/mvdicarlo/postybirb"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-plus"
)
depends=(
    "electron${_electronversion}"
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/mvdicarlo/postybirb/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-rpm-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-rpm-x86_64.rpm")
sha256sums=('f549ac630b1a4e0e8a80ae21c37d1c7d63f00e1cd155d5f747a5315b54ae2e31'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('69fafcd1075b333380492d5cb883965bab93ae0b2639ac69b9f667f9c133cfb5')
sha256sums_x86_64=('f64203b9db27d20ad3bac08d336ac9aafe711606eb89c9de23b83da3459fd863')
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
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    local _app_dir=$(_get_app_dir)
    rm -rf \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/bufferutil/prebuilds/"{darwin-*,win32-*} \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/utf-8-validate/prebuilds/"{darwin-*,win32-*}
    case "${CARCH}" in
        aarch64)
            find "${_app_dir}/resources/app.asar.unpacked/node_modules" -type d -name "*x64*" -exec rm -rf {} +
            ;;
        x86_64)
            find "${_app_dir}/resources/app.asar.unpacked/node_modules" -type d -name "*arm64*" -exec rm -rf {} +
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
