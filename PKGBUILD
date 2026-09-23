# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=douyin-bin
_debname="com.${pkgname%-bin}.otohime"
pkgver=8.7.0
_electronversion=39
pkgrel=1
pkgdesc="Third-party Linux client for Douyin.第三方抖音 Linux 客户端"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.douyin.com"
_dlurl="https://github.com/kota-rina3/hokeshi"
license=('LicenseRef-douyin')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
source=(
    "LICENSE.html::${url}/draft/douyin_agreement/douyin_agreement_privacy.html"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/releases/download/${pkgname%-bin}${pkgver}/${_debname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/releases/download/${pkgname%-bin}${pkgver}/${_debname}_${pkgver}_amd64.deb")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            '5ec6b59a287204cbcbac040071f19d88897a0cb3156e794e6f05847cf5449a9e')
sha256sums_aarch64=('b258044d6d70396feb3c4c3a2f15e6535e63a8bf7de2e7e1c025509f73113e05')
sha256sums_x86_64=('d76a7ade09213fac9d7d5b2d1ce9109ba5b66a7f96b12ad9cd4c4d45ae4906dd')
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
        s/@cfgdirname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/Categories=Video;/Categories=AudioVideo;/g
        s/Exec=\/opt\/apps\/${_debname}\/files\/${pkgname%-bin}/Exec=${pkgname%-bin} %U/g
        s/Icon=\/opt\/apps\/${_debname}\/files\/resources\/app\/${pkgname%-bin}.png/Icon=${pkgname%-bin}/g
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
