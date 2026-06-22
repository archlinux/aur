# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=backend.ai-desktop
pkgname="${_pkgname//./-}-bin"
_appname='Backend.AI Desktop'
pkgver=26.4.9
_electronversion=39
pkgrel=1
pkgdesc="Provides a convenient environment for users, while allowing various commands to be executed without CLI. It also provides some visual features that are not provided by the CLI, such as dashboards and statistics."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.backend.ai/"
_ghurl="https://github.com/lablup/backend.ai-webui"
license=('LGPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname%-desktop}"
    "${_pkgname}"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip")
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/lablup/backend.ai-webui/v${pkgver}/manifest/backend-ai.iconset/icon_512x512%401x.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('c54209c33c387908bfaae40a9c5f6c96bacaa52684f2546068e2b4441f4a53b3'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('2243c817b9995ef32eb5ce7a0a171cb1ce2df6cedeb94027ee03cb6110d1b354')
sha256sums_x86_64=('3ec1eb80bfbc6c1b822d56e8ee9133956ebb8ab58cf8bd81e0788226e1b85397')
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
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
