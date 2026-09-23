# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yiyang-suite-bin
_pkgname=YiYang-Suite
pkgver=2.5.1
_electronversion=29
pkgrel=1
pkgdesc="An office tool suite that integrates mind maps, outline notes, flowcharts, Markdown, Office, and PDF annotations, dedicated to creating a concise and convenient document production environment for professionals."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.eo2suite.cn"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    '7zip'
)
makedepends=(
    'asar'
)
options=(
    '!strip'
    '!emptydirs'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://pkg-cdn.jianguoyun.com/static/exe/installer/${_pkgname}-Setup-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://pkg-cdn.jianguoyun.com/static/exe/installer/${_pkgname}-Setup-linux-amd64.deb")
sha256sums=('5ec6b59a287204cbcbac040071f19d88897a0cb3156e794e6f05847cf5449a9e')
sha256sums_aarch64=('e1df492c702d5d256dd8c52ae5e9115ca5e01aa13ae5afeb595d7f1216c17fe1')
sha256sums_x86_64=('116955dce936b0a0a8407bf062c600d7c429e8da9c09ba7052cd573f640bccb4')
pkgver() {
    cd "${srcdir}/app.asar.unpacked"
    awk -F'"' '/"version"/{print $4}' package.json
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
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i "s/\/opt\/eo2suite\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    local _app_dir=$(_get_app_dir)
    case "${CARCH}" in
        aarch64)
            _arch_rem="x64"
            _archdir="arm64"
            ;;
        x86_64)
            _arch_rem="arm"
            _archdir="x64"
            ;;
    esac
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/dist" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    find "${srcdir}" \
        \( -name "*mac*" -o -name "*${_arch_rem}*" -o -name "*ia32*" -o -name "*darwin*" \) \
        -exec rm -rf {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    ln -sf "/usr/bin/7za" "${_app_dir}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/${_archdir}/7za"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${_app_dir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}