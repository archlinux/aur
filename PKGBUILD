# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=icalingua
pkgname="${_appname}++-bin"
_pkgname='Icalingua++'
pkgver=2.26.8
_electronversion=39
pkgrel=1
pkgdesc="A branch of deleted Icalingua, with limited support."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/Icalingua-plus-plus/Icalingua-plus-plus"
license=("AGPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-electron"
)
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.armv7l.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.x86_64.rpm")
source=("${pkgname%-bin}.sh")
sha256sums=('5ec6b59a287204cbcbac040071f19d88897a0cb3156e794e6f05847cf5449a9e')
sha256sums_aarch64=('6d3e9b16706943ac477682e89501b071d81586ca16594103a8b1b75c46513e76')
sha256sums_armv7h=('05aea1b52f2b8d975740e220adf628652938c5a3d753005c25964475a75131f1')
sha256sums_x86_64=('fe1b80c3463d29a5dd54f3f2f10d06189f38afc635cea009133fdebd0befa412')
_get_app_dir() {
	find "${srcdir}" -type d -name "node_modules" -prune -o -type f -name "resources.pak" -print0 | xargs -0 dirname | head -n 1
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
    _check_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
        s/\"\/opt\/${_pkgname}\/${_appname}\"/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
    local _app_dir=$(_get_app_dir)
    case "${CARCH}" in
        aarch64)    _arch_rem="x64"     ;;
        x86_64)     _arch_rem="arm64"   ;;
    esac
    find "${_app_dir}/resources/app.asar.unpacked/node_modules" \
        \( -name "*darwin*" -o -name "*win32*" -o -name "*${_arch_rem}*" \) \
        -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
