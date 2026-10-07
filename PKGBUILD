# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# `vscodium-electron.js` from Richardn <rniu at umich dot edu>
_appname=code
_pkgname="visual-studio-${_appname}"
pkgname="${_pkgname}-electron-bin"
_debname=com.microsoft.VSCode
pkgver=1.141.0
_electronversion=43
pkgrel=1
pkgdesc="Visual Studio Code (vscode): Editor for building and debugging modern web and cloud applications."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://code.visualstudio.com/"
_ghurl="https://github.com/microsoft/vscode"
#_dlurl="https://packages.microsoft.com/yumrepos/vscode/Packages/c"
license=('LicenseRef-scancode-commercial-license')
provides=(
    "${_pkgname}"
    "vs${_appname}"
)
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
    "${_appname}"
    "${_pkgname}-insiders"
    "${_pkgname}-marketplace"
)
depends=(
    "electron${_electronversion}"
    'nodejs'
    'libx11'
    'libxkbfile'
    'webkit2gtk-4.1'
    'libsecret'
)
optdepends=(
    'gvfs: For move to trash functionality'
    'libdbusmenu-glib: For KDE global menu'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-arm64")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-armhf")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64")
sha256sums=('68a94e4a9d746da48f5bb990d48b434363e476dfde006394a3ced94b4a54b4a7'
            '4eb64dab756b002c40e8e88e0f9af3238cbfeadedc382ca877363e49f0bd1f93')
sha256sums_aarch64=('1440304b14a016f1f5064fa1bab1882e06f201cae51988cc821b7cc0f473df5b')
sha256sums_armv7h=('f804f4bff3f8986850dbfcc1f98e95b255101f91d0bc485f7ae261e1058159ed')
sha256sums_x86_64=('6e8ca115fbe125fc2480bd5a853140151aa636a303082d4b8c3194a5c1508b2a')
pkgver() {
    cd "${srcdir}/usr/share/${_appname}/resources/app"
    grep '"version": ' package.json | awk '{print $2}' | tr -d '"' | tr -d ','
}
_get_app_dir() {
	find "${srcdir}" -type d -name "node_modules" -prune -o -type f -name "resources.pak" -print0 | xargs -0 dirname | head -n 1
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
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i "s/@ELECTRON@/electron${_electronversion}/g" "${srcdir}/${pkgname%-bin}.js"
    sed -i "s/${_debname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/usr/share/appdata/${_debname}.appdata.xml"
    sed -i -e "
        s/\/usr\/share\/${_appname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=vs${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_debname}"*.desktop
    case "${CARCH}" in
        aarch64)    _arch_rem="x64" ;;
        x86_64)   _arch_rem="arm64" ;;
    esac
    local _app_dir="$(_get_app_dir)"
    find "${_app_dir}/resources/app" \
        \( -name "*darwin*" -o -name "*${_arch_rem}*" -o -name "*win32*" \) \
        -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir="$(_get_app_dir)"
    cp -a "${_app_dir}/resources/app/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/appdata/${_debname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.UrlHandler.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}-UrlHandler.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_appname}-workspace.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}-workspace.xml"
    install -Dm644 "${srcdir}/usr/share/pixmaps/vs${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${_appname}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${_appname}" -t "${pkgdir}/usr/share/zsh/vendor-completions/"
    install -Dm644 "${srcdir}/usr/share/${_appname}/resources/app/licenses/"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
