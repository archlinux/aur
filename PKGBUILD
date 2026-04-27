# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy-bin
_pkgname=Escrcpy
pkgver=2.9.0
_electronversion=33
pkgrel=2
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
)
makedepends=(
    'asar'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('6c983d2df8669a2230402474b7f901da4f426611cfab9e99e7ef302268600f27')
sha256sums_x86_64=('37baaca0aa7139853396778726b946034a726fbafd11ccfcff73eb7b911fde8c')
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
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar"
    find "${srcdir}/app.asar.unpacked/"{dist,dist-electron} -type f -exec sed -i "s/process.resourcesPath/\"\/usr\/lib\/${pkgname%-bin}\"/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/opt/${_pkgname}/resources/app.asar"
    case "${CARCH}" in
        aarch64)
            ln -sf "/usr/bin/adb" "${srcdir}/opt/${_pkgname}/resources/extra/linux-arm64/scrcpy/adb"
            ln -sf "/usr/bin/fastboot" "${srcdir}/opt/${_pkgname}/resources/extra/linux-arm64/scrcpy/fastboot"
            ln -sf "/usr/bin/scrcpy" "${srcdir}/opt/${_pkgname}/resources/extra/linux-arm64/scrcpy/scrcpy"
            ln -sf "/usr/share/scrcpy/scrcpy-server" "${srcdir}/opt/${_pkgname}/resources/extra/linux-arm64/scrcpy/scrcpy-server"
            ln -sf "/usr/share/scrcpy/scrcpy-server" "${srcdir}/opt/${_pkgname}/resources/common/extra/wscrcpy/scrcpy-server"
            ;;
        x86_64)
            ln -sf "/usr/bin/adb" "${srcdir}/opt/${_pkgname}/resources/extra/linux-x64/scrcpy/adb"
            ln -sf "/usr/bin/fastboot" "${srcdir}/opt/${_pkgname}/resources/extra/linux-x64/scrcpy/fastboot"
            ln -sf "/usr/bin/gnirehtet" "${srcdir}/opt/${_pkgname}/resources/extra/linux-x64/gnirehtet/gnirehtet"
            ln -sf "/usr/bin/scrcpy" "${srcdir}/opt/${_pkgname}/resources/extra/linux-x64/scrcpy/scrcpy"
            ln -sf "/usr/share/scrcpy/scrcpy-server" "${srcdir}/opt/${_pkgname}/resources/extra/linux-x64/scrcpy/scrcpy-server"
            ln -sf "/usr/share/scrcpy/scrcpy-server" "${srcdir}/opt/${_pkgname}/resources/extra/common/wscrcpy/scrcpy-server"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    ln -sf "/usr/lib/${pkgname%-bin}/app.asar.unpacked/node_modules/@img/sharp-libvips-linux-x64/lib/libvips-cpp.so.8.17.3" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/lib/libvips-cpp.so.8.17.3"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
