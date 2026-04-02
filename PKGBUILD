# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# `vscodium-electron.js` from Richardn <rniu at umich dot edu>
_appname=code
_pkgname="visual-studio-${_appname}"
pkgname="${_pkgname}-electron-bin"
pkgver=1.114.0
_electronversion=39
pkgrel=1
pkgdesc="Visual Studio Code (vscode): Editor for building and debugging modern web and cloud applications.(Prebuilt and System-wide Electron edition)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://code.visualstudio.com/"
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
    'libx11'
    'libxkbfile'
    'ripgrep'
    'python'
    'python-fonttools'
    'perl'
    'webkit2gtk-4.1'
    'libsecret'
)
optdepends=(
    'gvfs: For move to trash functionality'
    'libdbusmenu-glib: For KDE global menu'
)
source=(
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-arm64")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-armhf")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64")
sha256sums=('dc5406ddd35ed5e3be39fe0a5a460f061aff3d296dc70124fd3eface8444c947'
            'c418b7c5c17b3771f53541b46ed1eff461de5871e2c7c177546e2577d480594f')
sha256sums_aarch64=('856bc4890170a0ea3d6a919f37c607f6c5ff331a9f5db26d76550e92f2728acb')
sha256sums_armv7h=('3183fec6237e571a9cdbf6f02b16259c064b1d5d0303a116c3aeeb2411bfb9ad')
sha256sums_x86_64=('a5f5426a09eeef50623a2330619b5e00caf4d73b450ad6b1f6b8957c45dad7c3')
pkgver() {
    cd "${srcdir}/usr/share/${_appname}/resources/app"
    grep '"version": ' package.json | awk '{print $2}' | tr -d '"' | tr -d ','
}
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/usr/share/${_appname}/${_appname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i "s/@ELECTRON@/electron${_electronversion}/g" "${srcdir}/${pkgname%-bin}.js"
    sed -i "s/${_appname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/usr/share/appdata/${_appname}.appdata.xml"
    sed -i -e "
        s/\/usr\/share\/${_appname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=vs${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/"{"${_appname}-url-handler.desktop","${_appname}.desktop"}
    ln -sf "/usr/bin/rg" "${srcdir}/usr/share/${_appname}/resources/app/node_modules/@vscode/ripgrep/bin/rg"
    case "${CARCH}" in
        aarch64)
            find "${srcdir}/usr/share/${_appname}/resources/app/node_modules/@anthropic-ai/sandbox-runtime" \
                -type d -name "x64" -exec rm -rf {} +
            ;;
        x86_64)
            find "${srcdir}/usr/share/${_appname}/resources/app/node_modules/@anthropic-ai/sandbox-runtime" \
                -type d -name "arm64" -exec rm -rf {} +
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	find "${srcdir}/usr/share/${_appname}/resources/app" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/usr/share/${_appname}/resources/app" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/usr/share/${_appname}/resources/app/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/usr/share/appdata/${_appname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}-url-handler.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_appname}-workspace.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}-workspace.xml"
    install -Dm644 "${srcdir}/usr/share/pixmaps/vs${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${_appname}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${_appname}" -t "${pkgdir}/usr/share/zsh/vendor-completions/"
    install -Dm644 "${srcdir}/usr/share/${_appname}/resources/app/licenses/"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
