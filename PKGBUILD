# Maintainer: AnRan <2318621872 at qq dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com> (launcher script approach)
pkgname=zcode-bin
_pkgname=ZCode
pkgver=3.3.6
_electronversion=41
pkgrel=2
pkgdesc="ZCode - AI-powered code editor by ZAI (Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://zcode.z.ai/"
_dlurl="https://cdn-zcode.z.ai/zcode/electron/releases"
license=('LicenseRef-ZCode')
depends=(
    "electron${_electronversion}"
    'python'
    'python-reportlab'
    'python-lxml'
    'python-pillow'
    'python-defusedxml'
    'libstdc++'
    'nodejs'
    'libgcc'
    'ripgrep'
)
makedepends=(
    'asar'
)
options=(
    '!strip'
)
source=(
    "LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/${pkgver}/linux-arm64/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/${pkgver}/linux-x64/${_pkgname}-${pkgver}-linux-x64.deb")
sha256sums=('6f7a7821eec5ffc00c7e5c24ac0b917864d503253816c6546c723e84ed418919'
            '2bc285eed1aa4a838e0b96d96e44e9a0df63a5a2c54b623790039a5feb2f8a83')
sha256sums_aarch64=('a3e2859d4789ef0fb0b937bddd500723918e9bb0e079ac1509c6786c93bed1e1')
sha256sums_x86_64=('47dded48f48dc5db2e1f5a554fea8e5bb1f183fa2d263697e2f4837a985d95ff')
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
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    # Substitute placeholders in launcher script
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"

    # Fix .desktop file: remove /opt/ZCode/ prefix so Exec references the launcher directly
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"

    # Unpack app.asar, patch process.resourcesPath, and repack
    local _app_dir=$(_get_app_dir)
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    find "${srcdir}/app.asar.unpacked/out" -type f -exec sed -i "s/process.resourcesPath/'\/usr\/lib\/${pkgname%-bin}'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    rm -rf "${srcdir}/app.asar.unpacked"

    # Use system ripgrep instead of bundled
    ln -sf "/usr/bin/rg" "${_app_dir}/resources/tools/ripgrep/rg"

    # Remove unnecessary files to reduce package size
    rm -rf \
        "${_app_dir}/resources/"{apparmor-profile,package-type} \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/@lydell" \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/node-pty/"{bin,deps/winpty,prebuilds/{darwin-*,win32-*,linux-arm64}}
}
package() {
    # Install launcher script
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"

    # Install app resources
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"

    # Install .desktop file
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"

    # Install icons
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
