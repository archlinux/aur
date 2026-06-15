# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chaterm-bin
_pkgname=Chaterm
pkgver=0.12.0
_electronversion=41
pkgrel=1
pkgdesc="A terminal tool with AI Agent, makes you no need to learn complicated regular expressions, Perl and Python, switches and Linux commands, SQL syntax can easily manage thousands of devices!(Prebuilt version,use system-wide electron)"
arch=('x86_64')
url="https://chaterm.ai/"
_ghurl="https://github.com/chaterm/Chaterm"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python'
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('f9ab64de478795d2cee4dbb935d30b26248f1ad0b434c9aa24114c82fdf286bd'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_check_electron_version() {
    echo "Verifying Electron version..."
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
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
        s/@cfgdirname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar"
    find "${srcdir}/app.asar.unpacked/out" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    find "${srcdir}/app.asar.unpacked/node_modules" -type d \( -name "android-*" -o -name "darwin-*" -o -name "ios-*" -o -name "win32-*" -o -name "linux-arm64" \) \
        -exec rm -rf {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/opt/${_pkgname}/resources/app.asar"
    find "${srcdir}/opt/${_pkgname}/resources/" \
        \( -type d -path "*/app.asar.unpacked/node_modules/*" \
            \( -name "android-*" -o \
                -name "darwin-*" -o \
                -name "ios-*" -o \
                -name "win32-*" -o \
                -name "linux-arm64" \
            \) \
        \) -o \
        \( -type f \
            \( -name "apparmor-profile" -o \
                -name "package-type" -o \
                -name "*-arm64*" -o \
                -name "*-darwin-*" -o \
                -name "*-win32-*" \
            \) \
        \) \
        -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
