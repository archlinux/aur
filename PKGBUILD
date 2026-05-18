# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: oech3
# Contributor: xiota
pkgname=legcord-bin
_pkgname=Legcord
pkgver=1.2.4
_electronversion=41
pkgrel=2
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
sha256sums_aarch64=('1e930e8c3477a634e7c5972096420fc454a60b1c5fa1794bfe4dba645f14f10b')
sha256sums_armv7h=('21269dc09e9320cc64ed445ac0924223a12e27b09a53ef6b6a1c49ea36ad2219')
sha256sums_x86_64=('9796877e249da528a1a7a9dacbf93e28c02039cad81fb572bc3659d132b48217')
_check_electron_version() {
    echo "Verifying Electron version..."
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
    local _main_exe=""
    if [[ -n "${_app_dir}" ]]; then
        _main_exe=$(find "${_app_dir}" -maxdepth 1 -type f -executable -printf '%s %p\n' | sort -nr | head -n 1 | cut -d' ' -f2-)
    fi
    if [[ -n "${_main_exe}" ]]; then
        local _elec_ver=$(strings "${_main_exe}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1 | head -n 1)
        if [[ -n "${_elec_ver}" ]]; then
            if [[ "${_elec_ver}" != "${_electronversion}" ]]; then
                echo -e "\033[1;31mWarning: Electron version mismatch! Detected: ${_elec_ver}, Expected: ${_electronversion}\033[0m"
            else
                echo -e "Electron version verified: \033[1;31m${_elec_ver}\033[0m"
            fi
        fi
    else
        echo -e "\033[1;33mNote: Could not find Electron binary for version verification.\033[0m"
    fi
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
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    rm -rf \
        "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{darwin_*,freebsd_*,openbsd_*,win32_*} \
        "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_ia32,linux_loong64,linux_riscv64d}
    case "${CARCH}" in
        aarch64)
            rm -rf \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_armhf,linux_x64,musl_x64} \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/venmic-addon-linux-x64"
            ;;
        armv7h)
            rm -rf \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_arm64,linux_x64} \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/"{venmic-addon-linux-arm64,venmic-addon-linux-x64}
            ;;
        x86_64)
            rm -rf \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_arm64,linux_armhf,musl_arm64} \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/venmic-addon-linux-arm64"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
