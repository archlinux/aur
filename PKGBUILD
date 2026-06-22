# Maintainer: AnRan <2318621872 at qq dot com>
# Co-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zcode-bin
_pkgname=ZCode
pkgver=3.1.2
_electronversion=41
pkgrel=2
pkgdesc="ZCode - AI-powered code editor by CodeGeeX"
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
    'python-pillow'
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
    "${pkgname%-bin}-${pkgver}-x86_64.deb::https://cdn.codegeex.cn/zcode/electron/releases/${pkgver}/${_pkgname}-${pkgver}-linux-x64.deb"
    "LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a68ac2dd7e2c18b4221d664629aa5dcf2049176b6ecb2a7a5a6e6fc5ad3c13ed'
            '6f7a7821eec5ffc00c7e5c24ac0b917864d503253816c6546c723e84ed418919'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
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
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    local _app_dir=$(_get_app_dir)
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    find "${srcdir}/app.asar.unpacked/out" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    ln -sf "/usr/bin/rg" "${_app_dir}/resources/tools/ripgrep/rg"
    rm -rf \
        "${_app_dir}/resources/"{apparmor-profile,package-type} \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/@lydell" \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/node-pty/"{bin,deps/winpty,prebuilds/{darwin-*,win32-*,linux-arm64}}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
