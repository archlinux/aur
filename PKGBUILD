# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy-bin
_pkgname=Escrcpy
pkgver=3.2.0
_electronversion=42
pkgrel=1
pkgdesc="📱Graphical Scrcpy to display and control Android devices powered by Electron(Prebuilt version.Use system-wide electron).使用图形化的 Scrcpy 显示和控制您的 Android 设备，由 Electron 驱动。"
arch=(
    'aarch64'
    'x86_64'
)
url="https://escrcpy.viarotel.eu.org/"
_ghurl="https://github.com/viarotel-org/escrcpy"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'gnirehtet'
    'scrcpy'
    'android-tools'
    'nodejs'
)
makedepends=(
    'asar'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('48113fb7ca2c924975c9f1329bd1a1f7c6cc1021b00304c104a7c9ee2a4f94d0')
sha256sums_x86_64=('5d55ed8de3a2b7229cb662a4e128a2ebb58f32fb2415b9c10852679d0d96460a')
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
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    local _app_dir=$(_get_app_dir)
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    find "${srcdir}/app.asar.unpacked/"{dist,dist-electron} -type f -exec sed -i "s/process.resourcesPath/\"\/usr\/lib\/${pkgname%-bin}\"/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    case "${CARCH}" in
        aarch64)
            ln -sf "/usr/bin/adb" "${_app_dir}/resources/extra/linux-arm64/scrcpy/adb"
            ln -sf "/usr/bin/fastboot" "${_app_dir}/resources/extra/linux-arm64/scrcpy/fastboot"
            ln -sf "/usr/bin/scrcpy" "${_app_dir}/resources/extra/linux-arm64/scrcpy/scrcpy"
            ln -sf "/usr/share/scrcpy/scrcpy-server" "${_app_dir}/resources/extra/linux-arm64/scrcpy/scrcpy-server"
            ln -sf "/usr/share/scrcpy/scrcpy-server" "${_app_dir}/resources/extra/common/scrcpy/scrcpy-server"
            ln -sf "/usr/share/scrcpy/scrcpy-server" "${_app_dir}/resources/extra/common/wscrcpy/scrcpy-server"
            ;;
        x86_64)
            ln -sf "/usr/bin/adb" "${_app_dir}/resources/extra/linux-x64/scrcpy/adb"
            ln -sf "/usr/bin/fastboot" "${_app_dir}/resources/extra/linux-x64/scrcpy/fastboot"
            ln -sf "/usr/bin/gnirehtet" "${_app_dir}/resources/extra/linux-x64/gnirehtet/gnirehtet"
            ln -sf "/usr/bin/scrcpy" "${_app_dir}/resources/extra/linux-x64/scrcpy/scrcpy"
            ln -sf "/usr/share/scrcpy/scrcpy-server" "${_app_dir}/resources/extra/linux-x64/scrcpy/scrcpy-server"
            ln -sf "/usr/share/scrcpy/scrcpy-server" "${_app_dir}/resources/extra/common/wscrcpy/scrcpy-server"
            ln -sf "/usr/share/scrcpy/scrcpy-server" "${_app_dir}/resources/extra/common/scrcpy/scrcpy-server"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    ln -sf "/usr/lib/${pkgname%-bin}/app.asar.unpacked/node_modules/@img/sharp-libvips-linux-x64/lib/libvips-cpp.so.8.17.3" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/lib/libvips-cpp.so.8.17.3"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
}
