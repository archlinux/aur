# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=calmly-writer-bin
_pkgname=CalmlyWriter
pkgver=3.0.4
_electronversion=41
pkgrel=1
pkgdesc="An editor designed to focus on what you want to tell, with a simple, unobtrusive and ease-to-use user interface."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.calmlywriter.com"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
options=('!strip')
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}_${pkgver}-aarch64.rpm::${url}/pro/releases/${pkgname%-bin}-3-${pkgver}.aarch64.rpm")
source_x86_64=("${pkgname%-bin}_${pkgver}-x86_64.rpm::${url}/pro/releases/${pkgname%-bin}-3-${pkgver}.x86_64.rpm")
source=(
    "LICENSE.html::${url}/eula.htm"
    "${pkgname%-bin}.sh"
)
sha256sums=('f968adf93a81385f20c95c7354ee6e5afbc93b2a5d1f0f81abf3296aeca8faf1'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('4b87f1490902b7bcb52c38f66107bd79c8c1ea2e103afde95ba7b7b70c5ca7bd')
sha256sums_x86_64=('b98c714e524eea18593504e01703e4ed540c10a5c6268ce35bec9abd49dc097f')
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_check_electron_version() {
    echo "Verifying Electron version..."
    local _app_dir=$(_get_app_dir)
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
        s/\/opt\/${_pkgname}Pro\/${pkgname%-bin}-3/${pkgname%-bin}/g
        s/Icon=${pkgname%-bin}-3/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}-3.desktop"
    rm -rf "${srcdir}/opt/${_pkgname}Pro/resources/app.asar.unpacked/node_modules/font-list/libs/"{darwin,win32}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-3.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
