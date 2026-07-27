# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tuff-bin
_pkgname=Tuff
pkgver=2.4.13
_electronversion=41
pkgrel=1
pkgdesc="An open-source core for your OS, built on a sandboxed architecture with a local-first AI and a powerful TypeScript SDK.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://tuff.tagzxia.com/"
_ghurl="https://github.com/talex-touch/tuff"
license=('MPL-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'libxt'
    'nodejs'
)
makedepends=(
    'asar'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/ubuntu-latest-release-${pkgname%-bin}-${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('b59e87bc0875aa0a207c56e07c5d66ad850fc4a572cc28b7eb15548c7c407eef'
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
    sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    local _app_dir=$(_get_app_dir)
    # Extract asar archive (ignore errors from unpacked file references)
    rm -rf "${srcdir}/app.asar.unpacked"
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked" 2>/dev/null || true
    # Remove original asar and unpacked dir from app directory
    rm -rf "${_app_dir}/resources/app.asar" "${_app_dir}/resources/app.asar.unpacked"
    # Make files writable
    chmod -R u+w "${srcdir}/app.asar.unpacked" 2>/dev/null || true
    # Replace process.resourcesPath in JS files
    find "${srcdir}/app.asar.unpacked/out" -type f -name "*.js" -exec sed -i "s/process.resourcesPath/'\/usr\/lib\/${pkgname%-bin}'/g" {} + 2>/dev/null || true
    # Repack the asar archive
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
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
}