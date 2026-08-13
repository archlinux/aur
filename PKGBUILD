# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=issie-bin
pkgver=6.0.17
_electronversion=43
pkgrel=1
pkgdesc="An intuitive cross-platform hardware design application."
arch=(
    'aarch64'
    'x86_64'
)
url="https://tomcl.github.io/issie"
_ghurl="https://github.com/tomcl/issie"
license=('GPL-3.0-only')
conflits=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'asar'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.zip")
sha256sums=('a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('5b0229f75c4467ec7a572d48eb7d3a040e5fa59245f583619883215cdb8cbd80')
sha256sums_x86_64=('2b5e3e5f3546b6633b64d8237a02ecae0c5ad646668baf5c73f8f369be77e968')
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
    _check_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin} --no-sandbox %U"
    local _app_dir=$(_get_app_dir)
    rm -rf "${_app_dir}/resources/app.asar.unpacked/node_modules/usb/prebuilds/"{android-*,darwin-*,win32-*}
    case "${CARCH}" in
        aarch64)
            rm -rf "${_app_dir}/resources/app.asar.unpacked/node_modules/usb/prebuilds/"{linux-arm,linux-ia32,linux-x64}
            ;;
        x86_64)
            rm -rf "${_app_dir}/resources/app.asar.unpacked/node_modules/usb/prebuilds/"{linux-arm*,linux-ia32}
            ;;
    esac
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    # Fix: Inject 'const path = require("path");' at the top of index.js to fix "path is not defined" error
    sed -i '1s/^/const path = require("path");\n/' "${srcdir}/app.asar.unpacked/build/index.js"
    # Fix: Replace process.defaultApp with ELECTRON_IS_DEV env var for dev mode detection
    sed -i 's/process\.defaultApp === true/process.env.ELECTRON_IS_DEV !== "0"/' "${srcdir}/app.asar.unpacked/build/index.js"
    find "${srcdir}/app.asar.unpacked/build" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_app_dir}/resources/static/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
