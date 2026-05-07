# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ldtk-bin
_pkgname=LDtk
pkgver=1.5.3
_electronversion=24
pkgrel=5
pkgdesc="Modern and efficient 2D level editor with a strong focus on user-friendliness.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://ldtk.io/"
_ghurl="https://github.com/deepnight/ldtk"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libdbusmenu-glib'
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/ubuntu-distribution.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/deepnight/ldtk/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('8bb1c870ab35d2cadfbf08a119d3049e7986a2a80558d2610babc67fcd502566'
            'f409a37a40e823efefddac3140d991141633d4db3cec4f8667bc23b846dcc335'
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
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    mv "${srcdir}/${_pkgname} ${pkgver} installer.AppImage" "${srcdir}/${pkgname%-bin}-${pkgver}-x86_64.AppImage"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _check_electron_version
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/" -type d -exec chmod 755 {} \;
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i 's/misc_JsTools\.getExeDir()/"\/usr\/lib\/'${pkgname%-bin}'"/g' "${srcdir}/app.asar.unpacked/assets/js/renderer.js"
    sed -i 's/var path = this\.args\.soloValues\.slice()\.join(" ");/var _args = this.args.soloValues.filter(function(v) { return v \&\& !v.endsWith(".asar"); }); var path = _args.join(" ");/' "${srcdir}/app.asar.unpacked/assets/js/renderer.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/squashfs-root/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    cp -a "${_app_dir}/extraFiles/" "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
