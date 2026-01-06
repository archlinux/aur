# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy-bin
_pkgname=Escrcpy
pkgver=2.0.1
_electronversion=33
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
)
makedepends=(
    'asar'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/workspace-v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/workspace-v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('db624bd2dead232b096530c062801f8206ee88e038c8a0ee799971bf2c97bebd')
sha256sums_x86_64=('399b31b3b29c3e18e5ea49e9f1facbad3a463441bf2a900ca42516761961946c')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/@${pkgname%-bin}desktop" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/@${pkgname%-bin}desktop/${pkgname%-bin}/g
        s/Icon=@${pkgname%-bin}desktop/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/@${pkgname%-bin}desktop.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/"{dist,dist-electron} -type f -exec sed -i "s/process.resourcesPath/\"\/usr\/lib\/${pkgname%-bin}\"/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    case "${CARCH}" in
        aarch64)
            ln -sf "/usr/bin/adb" "${srcdir}/opt/${_pkgname}/resources/extra/linux-arm64/scrcpy/adb"
            ;;
        x86_64)
            ln -sf "/usr/bin/gnirehtet" "${srcdir}/opt/${_pkgname}/resources/extra/linux-x64/gnirehtet/gnirehtet"
            ln -sf "/usr/bin/scrcpy" "${srcdir}/opt/${_pkgname}/resources/extra/linux-x64/scrcpy/scrcpy"
            ln -sf "/usr/share/scrcpy/scrcpy-server" "${srcdir}/opt/${_pkgname}/resources/extra/linux-x64/scrcpy/scrcpy-server"
            ln -sf "/usr/bin/adb" "${srcdir}/opt/${_pkgname}/resources/extra/linux-x64/scrcpy/adb"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/extra" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/@${pkgname%-bin}desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/@${pkgname%-bin}desktop.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}
