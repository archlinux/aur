# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mailspring-bin
_pkgname=Mailspring
pkgver=1.26.0
_electronversion=44
pkgrel=1
pkgdesc="A beautiful, fast and fully open source mail client."
arch=(
    'aarch64'
    'x86_64'
)
url="https://getmailspring.com/"
_ghurl="https://github.com/Foundry376/Mailspring"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'krb5'
    'db5.3'
    'tidy'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-0.1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-0.1.x86_64.rpm")
sha256sums=('bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
sha256sums_aarch64=('5d43f37f8f7524706402b9e83ea7a40a07109c2be9355f67a79b65d1da5152b0')
sha256sums_x86_64=('84ce5d587574900f5524353c7bab249aaaacb9409ee82784e8ee542f42a99950')
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
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
_get_current_desktop_env() {
    if [ -n "$XDG_CURRENT_DESKTOP" ]; then
        if echo "$XDG_CURRENT_DESKTOP" | grep -i gnome > /dev/null; then
            echo "gnome"
            return 0
        elif echo "$XDG_CURRENT_DESKTOP" | grep -i kde > /dev/null || echo "$XDG_CURRENT_DESKTOP" | grep -i plasma > /dev/null; then
            echo "plasma"
            return 0
        fi
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
    _desktop_env="$(_get_current_desktop_env)"
    if [ "${_desktop_env}" = "gnome" ];then
        sed -i "s/Exec=${pkgname%-bin}/Exec=${pkgname%-bin} --password-store=\"gnome-libsecret\"/g" \
            "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    fi
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
}
