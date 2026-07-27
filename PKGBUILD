# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: oech3
# Contributor: xiota
pkgname=legcord-bin
_pkgname=Legcord
pkgver=1.3.0
_electronversion=43
pkgrel=1
pkgdesc="a custom client designed to enhance your Discord experience while keeping everything lightweight.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://legcord.app"
_ghurl="https://github.com/Legcord/Legcord"
license=('OSL-3.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python'
    'libpulse'
    'nodejs'
    'libpipewire'
)
options=(
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/Legcord/Legcord/v${pkgver}/license.txt"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7l.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.rpm")
sha256sums=('c2cba32542cf3a65813e83fdbd259020d6d62b6833aa18f38aec983837dc9e4d'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('9324822b9087aa9774a37eafbc72afee401e21877797ffd735073f5a9aaf4b16')
sha256sums_armv7h=('57c5e4a4cbb2b8a486b5128ab41bc115a0a145f9f3158dbef37745483c7f2516')
sha256sums_x86_64=('9fa350d2c71057e34e0f1a29ed564f39005ca056a8bac04651b09062f27f327f')
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
    sed -i -e "
        s/\/opt\/${_pkgname}\///g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    local _app_dir=$(_get_app_dir)
    rm -rf \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{darwin_*,freebsd_*,openbsd_*,win32_*} \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_ia32,linux_loong64,linux_riscv64d}
    case "${CARCH}" in
        aarch64)
            rm -rf \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_armhf,linux_x64,musl_x64} \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/venmic-addon-linux-x64"
            ;;
        armv7h)
            rm -rf \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_arm64,linux_x64} \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/"{venmic-addon-linux-arm64,venmic-addon-linux-x64}
            ;;
        x86_64)
            rm -rf \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_arm64,linux_armhf,musl_arm64} \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/venmic-addon-linux-arm64"
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
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
