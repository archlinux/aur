# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=qoder
pkgname="${_appname}-ide-bin"
_pkgname='Qoder IDE'
pkgver=1.27.1
_electronversion=42
pkgrel=1
pkgdesc="Agent Programming Platform for Real Software.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://qoder.com/"
_ghurl="https://github.com/QoderAI/changelog-zh_CN"
license=('LicenseRef-custom')
conflicts=(
    "${_appname}"
    "${pkgname%-bin}"
)
provides=(
    "${_appname}=${pkgver}"
    "${pkgname%-bin}=${pkgver}"
)
depends=(
    "electron${_electronversion}"
    'libxkbfile'
    'nodejs'
    'python'
)
optdepends=(
    'bash'
    'zsh'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::https://download.qoder.com/release/latest/${pkgname%-bin}_${CARCH}.rpm"
    "LICENSE.html"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('941b1c6e3e3cf9d6d69742d3eaf48818df321fdcb312e5f558a8177fed0f1e10'
            'd93359b3ca57aec94960975eec23b6412dc8fc0c5b5fcbce57bee0931e01ec61'
            'cbeb2e78d46c0cbe8793e7a2c06bd339e3ed9dca5f0ae1196281b8d2cf60c4c5'
            '700067aa4b354a91ab3374b5495af9eb3093855a3d8016a8303e88abf3470599')
pkgver() {
    cd "${srcdir}/usr/share/${pkgname%-bin}/resources/app"
    grep '"version":' featureFlags.json | awk -F'"version": "' '{print $2}' | awk -F',' '{print $1}' | tr -d '"'
}
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
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/@ELECTRON@/electron${_electronversion}/g" "${srcdir}/${pkgname%-bin}.js"
    sed -i "s/\/usr\/share\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}"*.desktop
    local _app_dir=$(_get_app_dir)
    find "${_app_dir}/resources/app" -name "win32-*" -exec rm -rf {} +
    rm -rf \
        "${_app_dir}/resources/app/node_modules/windows-foreground-love" \
        "${_app_dir}/resources/app/node_modules/native-is-elevated" \
        "${_app_dir}/resources/app/extensions/ms-vscode.js-debug/src/win32-app-container-tokens."*".node"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/app/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}"* -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}-workspace.xml" -t "${pkgdir}/usr/share/mime/packages"
    if [ -x "/usr/bin/zsh" ];then
        install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${_appname}" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    fi
    if [ -x "/usr/bin/zsh" ];then
        install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${_appname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
    fi
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
