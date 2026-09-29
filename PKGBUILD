# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: AlphaJack <alphajack at tuta dot io>
# Contributor: Asuka Minato
_appname=teams-for-linux
pkgname="${_appname}-electron-bin"
pkgver=2.23.0
_electronversion=43
pkgrel=1
pkgdesc="Unofficial Microsoft Teams for Linux client."
arch=(
	'aarch64'
	'armv7h'
	'x86_64'
)
url="https://ismaelmartinez.github.io/teams-for-linux/"
_ghurl="https://github.com/IsmaelMartinez/teams-for-linux"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
	"${_appname}"
	"${_appname}-wayland-hook"
	"${_appname}-git"
	"${_appname}-bin"
	"${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'asar'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}.aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}.armv7l.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}.x86_64.rpm")
sha256sums=('bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
sha256sums_aarch64=('2ed031e2018b12463e765da5ba836f025aa4d7ffe5a6d2c26e6ba770f5b3a2a6')
sha256sums_armv7h=('dc2891f59525ecdf390423a909cc56e79fd2702dee7deec6c2bb5cd943557336')
sha256sums_x86_64=('5e6859b5fac6919b03969ca7ee8cfbddd8ce9616876ac56881565ede1aa9f331')
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
        s/@cfgdirname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i -e "
        s/\/opt\/${_appname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
    local _app_dir=$(_get_app_dir)
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
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
