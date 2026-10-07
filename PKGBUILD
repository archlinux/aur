# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=notesnook
pkgname="${_pkgname}-electron-bin"
_appname=Notesnook
pkgver=3.4.9
_electronversion=37
pkgrel=1
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote."
arch=(
    'aarch64'
    'x86_64'
)
url="https://notesnook.com/"
_ghurl="https://github.com/streetwriters/notesnook"
license=('GPL-3.0-or-later')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
sha256sums_aarch64=('3b60969aec90f482e3b4346cf43aa77aa1066f20fd0d6317db516c1bf5b5a8da')
sha256sums_x86_64=('2bb6e42d97240156099cba498e4e17a4635c8e2981b50fb03d84ea46e0fbaafe')
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
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
        s/@cfgdirname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _check_electron_version
    local _app_dir="$(_get_app_dir)"
    sed -i -e "
        s/Exec=AppRun/Exec=${_pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${_app_dir}/${_pkgname}.desktop"
    find "${_app_dir}/resources" -type d -exec chmod 755 {} +
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    sed -i -e "
        s/dirname(process.execPath), \"..\", \"Resources\"/dirname(\'\/usr\/lib\/${pkgname%-bin}\/${pkgname%-bin}\')/g
        s/dirname(process.execPath), \"resources\"/dirname(\'\/usr\/lib\/${pkgname%-bin}\/${pkgname%-bin}\')/g
    " "${srcdir}/app.asar.unpacked/build/electron.js"
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
