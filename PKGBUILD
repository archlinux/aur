# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# `vscodium-electron.js` from Richardn <rniu at umich dot edu>
_appname=codium
_pkgname="vs${_appname}"
pkgname="${_pkgname}-electron-bin"
pkgver=1.135.06055
_electronversion=42
pkgrel=1
pkgdesc="Free/Libre Open Source Software Binaries of Visual Studio Code."
arch=(
    'aarch64'
#    'armv7h'
    'x86_64'
)
url="https://vscodium.com/"
_ghurl="https://github.com/VSCodium/vscodium"
license=("MIT")
provides=(
    "${_pkgname}=${pkgver}"
    "${_appname}=${pkgver}"
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
    'libsecret'
    'webkit2gtk-4.1'
    'nodejs'
    'ripgrep'
)
optdepends=(
	'gvfs: For move to trash functionality'
	'libdbusmenu-glib: For KDE global menu'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/VSCodium/vscodium/${pkgver}/LICENSE"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/${pkgver}/codium-${pkgver}-el8.aarch64.rpm")
#source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/${pkgver}/codium-${pkgver}-el8.armv7hl.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/${pkgver}/codium-${pkgver}-el8.x86_64.rpm")
sha256sums=('2fa3f8948a0a17ea30b62845caf1ee8aae8b55b5417273920ca2df2642209e0e'
            '7222e3026ab0eda7d60698a036354a2bae4d0878b1d75fc893c91e30b60804bf'
            'c418b7c5c17b3771f53541b46ed1eff461de5871e2c7c177546e2577d480594f')
sha256sums_aarch64=('50766c9ebcf9bdc6937b0fe3e98d7d92c90a9b85b493cb3da3486770635123b0')
sha256sums_x86_64=('ccae25ecb04fe6d3f2f94d578d7ce2990481ae3650633d05c08192fb5fdbea12')
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
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i "s/@ELECTRON@/electron${_electronversion}/g" "${srcdir}/${pkgname%-bin}.js"
    sed -i "s/${_appname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/usr/share/appdata/${_appname}.appdata.xml"
    sed -i -e "
        s/\/usr\/share\/${_appname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/"{"${_appname}-url-handler.desktop","${_appname}.desktop"}
    local _app_dir=$(_get_app_dir)
    rm -rf "${_app_dir}/resources/app/node_modules.asar.unpacked/@vscode/ripgrep-universal/bin/"{darwin-*,win32-*,linux-arm,linux-ia32,linux-ppc64,linux-riscv64,linux-s390x}
    case "${CARCH}" in
        aarch64)
            find "${_app_dir}/resources/app/node_modules" -type d -name "*x64*" -exec rm -rf {} +
            find "${_app_dir}/resources/app/node_modules.asar.unpacked" -type d -name "*x64*" -exec rm -rf {} +
            ln -sf "/usr/bin/rg" "${_app_dir}/resources/app/node_modules.asar.unpacked/@vscode/ripgrep-universal/bin/linux-arm64/rg"
            ;;
        x86_64)
            find "${_app_dir}/resources/app/node_modules" -type d -name "*arm64" -exec rm -rf {} +
            find "${_app_dir}/resources/app/node_modules.asar.unpacked" -type d -name "*arm64" -exec rm -rf {} +
            ln -sf "/usr/bin/rg" "${_app_dir}/resources/app/node_modules.asar.unpacked/@vscode/ripgrep-universal/bin/linux-x64/rg"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/app/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/appdata/${_appname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}-url-handler.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${_appname}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${_appname}" -t "${pkgdir}/usr/share/zsh/vendor-completions/"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
