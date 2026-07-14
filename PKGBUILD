# Maintainer: AnRan <2318621872 at qq dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com> (launcher script approach)
pkgname=zcode-bin
_pkgname=ZCode
pkgver=3.3.5
_electronversion=41
pkgrel=1
pkgdesc="ZCode - AI-powered code editor by ZAI"
arch=('x86_64')
url="https://zcode.z.ai/"
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
    "${pkgname%-bin}-${pkgver}-x86_64.deb::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/${_pkgname}-${pkgver}-linux-x64.deb"
    "LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

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
