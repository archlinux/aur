# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=filen-desktop-bin
_pkgname=Filen
pkgver=3.0.53
_electronversion=43
pkgrel=1
pkgdesc="Desktop client including Syncing, Virtual Drive mounting, S3, WebDAV, File Browsing, Chats, Notes, Contacts and more.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://filen.io/"
_ghurl="https://github.com/FilenCloudDienste/filen-desktop"
license=('AGPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-git}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_linux_aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.rpm")
sha256sums=('a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('a6fd17505c3a9e44b59282d5700cbb75dd5706e8c6a0d4c4e87c21bec514ca3c')
sha256sums_x86_64=('c863facc31893d169d0077cbf5562d65e0a57d36941264fe336c346d0a1e0b9c')
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
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname%desktop}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    local _app_dir=$(_get_app_dir)
    find "${_app_dir}/resources" -type d -exec chmod 755 {} +
    rm -rf "${_app_dir}/resources/app.asar.unpacked/bin/"*
    case "${CARCH}" in
        aarch64)
            ln -sf /usr/bin/rclone "${_app_dir}/resources/app.asar.unpacked/bin/rclone-linux-arm64"
            ;;
        x86_64)
            ln -sf /usr/bin/rclone "${_app_dir}/resources/app.asar.unpacked/bin/rclone-linux-amd64"
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
}
