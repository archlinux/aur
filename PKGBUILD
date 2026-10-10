# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy-bin
_pkgname=Escrcpy
pkgver=3.3.1
_electronversion=42
pkgrel=1
pkgdesc="Display and control your Android device graphically with scrcpy.使用图形化的 Scrcpy 显示和控制您的 Android 设备"
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
sha256sums=('cebedc3391cbab6d43f37fbf3a87ddaad16597cb5ea487a4d55b1f478d810082')
sha256sums_aarch64=('860ff15dde861ff17e696f10b7d10b8cac3c77bf1e59a88c2641a97a7f06b5be')
sha256sums_x86_64=('218ea7d8961d2823c6dc36ac7445af7bed72e129333e4241c38dd2027d904a0a')
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
}
_check_electron_version() {
	local _v=$(strings "$(find "$(_get_app_dir)" -maxdepth 1 -type f \
		-executable -printf '%s %p\n' | sort -nr | head -1 | cut -d' ' -f2-)" \
		| grep -oP 'Electron/\K[0-9]+' | head -1)
	[[ -z "$_v" ]] && { echo -e "\033[1;33mNote: Could not check version.\033[0m"; return; }
	(( _v == _electronversion )) && c=32 || c=31
	echo -e "Electron version: \033[1;${c}m$_v$([[ $c -eq 31 ]] && echo " (expected $_electronversion)")\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    local _app_dir="$(_get_app_dir)"
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
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
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
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
