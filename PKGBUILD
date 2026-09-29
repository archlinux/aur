# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=cherry-studio
pkgname="${_appname}-electron-bin"
_pkgname='Cherry Studio'
pkgver=2.1.3
_electronversion=44
pkgrel=1
pkgdesc="AI productivity studio with smart chat, autonomous agents, and 300+ assistants. Unified access to frontier LLMs."
arch=(
    'aarch64'
    'x86_64'
)
url="https://cherryai.com/"
_ghurl="https://github.com/CherryHQ/cherry-studio"
license=(
    'AGPL-3.0-or-later'
    'LicenseRef-custom'
)
provides=("${_appname}=${pkgver}")
conflicts=("${_appname}")
depends=(
    "electron${_electronversion}"
    'libevdev'
    'python'
    'python-yaml'
    'nodejs'
    'bun'
    'ripgrep'
    'uv'
    'mise'
)
makedepends=(
    'asar'
)
optdepends=(
    'ollama: Use your local LLM'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/CherryHQ/cherry-studio/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /-}-${pkgver}-linux-arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /-}-${pkgver}-linux-x64.rpm")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            'bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
sha256sums_aarch64=('9833478f8d0cff045b0b9dfda1c83544e802fe383ded12b96b27fe69e90cc629')
sha256sums_x86_64=('f1c9fabdbe384ba69da2bdce48417ea38d08259d89acec888f966dc703b4e672')
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
        s/@cfgdirname@/${_pkgname//-/}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i -e "
        s/\"\/opt\/${_pkgname}\/${_pkgname// /}\"/${pkgname%-bin}/g
        s/Icon=${_pkgname// /}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname// /}.desktop"
    local _app_dir="$(_get_app_dir)"
    case "${CARCH}" in
        aarch64)
            _arch_rem="x64"
            _archdir="linux-arm64"
            ;;
        x86_64)
            _arch_rem="arm64"
            _archdir="linux-x64"
            ;;
    esac
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked" || continue
    find "${srcdir}/app.asar.unpacked/out" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    find "${srcdir}" -type d \
        \( -name "*darwin*" -o -name "*win32*" -o -name "*${_arch_rem}*" \) \
        -exec rm -rf {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    ln -sf "/usr/bin/bun" "${_app_dir}/resources/app.asar.unpacked/resources/binaries/${_archdir}/bun"
            ln -sf "/usr/bin/rg" "${_app_dir}/resources/app.asar.unpacked/resources/binaries/${_archdir}/rg"
            ln -sf "/usr/bin/uv" "${_app_dir}/resources/app.asar.unpacked/resources/binaries/${_archdir}/uv"
            ln -sf "/usr/bin/uvx" "${_app_dir}/resources/app.asar.unpacked/resources/binaries/${_archdir}/uvx"
            ln -sf "/usr/bin/mise" "${_app_dir}/resources/app.asar.unpacked/resources/binaries/${_archdir}/mise"
    find "${_app_dir}/resources" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname// /}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
