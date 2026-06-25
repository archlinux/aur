# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=tidgi
pkgname="${_pkgname}-desktop-bin"
_appname=TidGi
pkgver=0.14.0
_electronversion=41
pkgrel=1
pkgdesc="An privatcy-in-mind, automated, auto-git-backup, freely-deployed Tiddlywiki knowledge management Desktop note app, with local REST API.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://tidgi.fun/"
_ghurl="https://github.com/tiddly-gittly/TidGi-Desktop"
license=('MPL-2.0')
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
provides=(
    "${pkgname%-bin}=${pkgver}"
)
depends=(
    "electron${_electronversion}"
    'git'
)
makedepends=(
    'asar'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}-1/${_pkgname}-${pkgver}-1.arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}-1/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums=('ccfd848e97dd874460bd2499b0750127add3e034d024014fbd6e6a7d0398e676')
sha256sums_aarch64=('59b33010e8056cac0d558d82ce8b4109500b688c252ac1b4f0e0843881a35019')
sha256sums_x86_64=('77bbe7efadf1a5e440c5249926977f8a29246163b8594fb82ae46c2ee0dfc951')
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
        s/@cfgdirname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i "s/${_pkgname} %U/${pkgname%-bin} %U/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    local _app_dir=$(_get_app_dir)
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    find "${srcdir}/app.asar.unpacked/.vite" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    rm -rf "${_app_dir}/resources/node_modules/dugite/git"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
