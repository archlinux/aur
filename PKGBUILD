# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# `vscodium-electron.js` from Richardn <rniu at umich dot edu>
_appname=code
_pkgname="visual-studio-${_appname}"
pkgname="${_pkgname}-electron-bin"
pkgver=1.121.0
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
sha256sums=('68a94e4a9d746da48f5bb990d48b434363e476dfde006394a3ced94b4a54b4a7'
            '700067aa4b354a91ab3374b5495af9eb3093855a3d8016a8303e88abf3470599')
sha256sums_aarch64=('a8ca5fabb0e04250c54d093aeba04dbf2e4d6b31c658119a34a90626c9166284')
sha256sums_armv7h=('571567e2f5ae656bb77dfe1ce4dd4b9a5a27cf16faf4b359e9a6bf761622e665')
sha256sums_x86_64=('65866e05cce8d855b6070a6cbe839ed94715b72429bd07018371c37517010abf')
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
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
    cp -a "${_app_dir}/resources/app/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/appdata/${_appname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}-url-handler.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_appname}-workspace.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}-workspace.xml"
    install -Dm644 "${srcdir}/usr/share/pixmaps/vs${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${_appname}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${_appname}" -t "${pkgdir}/usr/share/zsh/vendor-completions/"
    install -Dm644 "${srcdir}/usr/share/${_appname}/resources/app/licenses/"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
