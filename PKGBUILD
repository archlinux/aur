# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=coze-bin
_pkgname=Coze
_debname="com.${pkgname%-bin}.uos"
pkgver=1.1.39
_electronversion=39
pkgrel=1
pkgdesc="Unofficial Linux version of Coze client.Work is handed over to coze, creation doesn't have to wait.扣子客户端非官方Linux版.工作交给扣子，创造不必等待."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.coze.cn"
_ghurl="https://github.com/kota-rina3/hokeshi"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
)
source=(
    "LICENSE.html::https://docs.coze.cn/guides_terms-of-service"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgname%-bin}-${pkgver}/${_debname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgname%-bin}-${pkgver}/${_debname}_${pkgver}_amd64.deb")
sha256sums=('08ae9b4bb725b1611f3c4150d49d54b9b60f72b2b2c18d63d8c8bc4336de9696'
            '5ec6b59a287204cbcbac040071f19d88897a0cb3156e794e6f05847cf5449a9e')
sha256sums_aarch64=('a6c454448f839f15440314d58a42116a52bfc32adcdb1e358c24550b2aedaeb4')
sha256sums_x86_64=('9f3257506841fe71ed8eda2e6a4963f1fdab60b5faaa0117b05112d1b87555b6')
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
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/\/opt\/apps\/${_debname}\/files\/${pkgname%-bin}/${pkgname%-bin} %U/g
        s/\/opt\/apps\/${_debname}\/files\/resources\/${pkgname%-bin}.png/${pkgname%-bin}/g
    " "${srcdir}/opt/apps/${_debname}/entries/applications/${pkgname%-bin}.desktop"
    local _app_dir=$(_get_app_dir)
    rm -rf "${_app_dir}/resources/elevate.exe"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${_app_dir}/resources/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}