# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=godot-launcher-bin
_pkgname='Godot Launcher'
_debname=org.godotlauncher.launcher
pkgver=1.12.0
_electronversion=43
pkgrel=1
pkgdesc="A streamlined, open-source tool designed to simplify and accelerate your Godot game development workflow."
arch=(
    'aarch64'
    'x86_64'
)
url="https://godotlauncher.org/"
_ghurl="https://github.com/godotlauncher/launcher"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/godotlauncher/launcher/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /_}-${pkgver}-linux_aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /_}-${pkgver}-linux_x86_64.rpm")
sha256sums=('982e513d86e81b53d35a4c757a54ce36c7b77752feeaac2dfaab3ddd0c86d7b1'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('6f7926b94911d821b646c9e7ba0a7649e7bea4c7afcc187b5983653205cb248b')
sha256sums_x86_64=('5a9da408fb2516f5a01ddd19624930b42437c7d6d1b1e9f5b873b901ae74bf00')
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
        s/\"\/opt\/${_pkgname}\/${_pkgname}\"/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_debname}.desktop"
    sed -i "s/${_debname}/${pkgname%-bin}/g" "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml"
    local _app_dir=$(_get_app_dir)
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    find "${srcdir}/app.asar.unpacked/dist-electron" -type f -exec sed -i "s/${_debname}.desktop/${pkgname%-bin}.desktop/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    find "${_app_dir}/resources" -type d -exec chmod 755 {} +
    rm -rf "${_app_dir}/resources/app.asar.unpacked/node_modules/@electron-internal/extract-zip/"{*win32*,*ia32*,*darwin*}
    case "${CARCH}" in
        aarch64)
            rm -rf "${_app_dir}/resources/app.asar.unpacked/node_modules/@electron-internal/extract-zip/"*x64*
            ;;
        x86_64)
            rm -rf "${_app_dir}/resources/app.asar.unpacked/node_modules/@electron-internal/extract-zip/"*arm*
            ;;
    esac
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
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
