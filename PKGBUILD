# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qianwen-bin
_shortname=qwen
_debname="com.${pkgname%-bin}.otohime"
pkgver=4.9.0.229
_electronversion=39
pkgrel=1
pkgdesc="Unofficial Linux version of Qianwan client, supports login, and supports uploading/downloading files.Linux版非官方千问客户端，支持登录，支持上传/下载文件"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.qianwen.com"
_ghurl="https://github.com/kota-rina3/hokeshi"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "LICENSE.html::https://terms.alicdn.com/legal-agreement/terms/privacy_policy_full/20231011201849846/20231011201849846.html"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${_shortname}-linux-${pkgver}/${_debname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${_shortname}-linux-${pkgver}/${_debname}_${pkgver}_amd64.deb")
sha256sums=('81caf3b6ec2a8ee62a4297cbe46ccec245bf692d6d3c0748497cd7410ad8cd45'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('7e4511291546df47c7fe0a81231eb4ee3fb2ab9a0e1ea98f7732eca41373aeb6')
sha256sums_x86_64=('19dba466256dec62e331f66ca90a13228504a0a01b53166718c7b2bcffc540e0')
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
        s/@cfgdirname@/tongyi/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/Exec=\/opt\/apps\/${_debname}\/files\/${pkgname%-bin}/Exec=${pkgname%-bin} %U/g
        s/Icon=\/opt\/apps\/${_debname}\/files\/resources\/app\/${_shortname}.png/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/apps/${_debname}/entries/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*entries/icons/*" | while read -r _i; do
        _icon_path="${_i#*entries/icons/}"
        install -Dm644 "${_i}" "${pkgdir}/usr/share/icons/${_icon_path}"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
