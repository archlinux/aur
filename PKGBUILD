# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mudita-center-bin
_pkgname='Mudita Center'
pkgver=4.0.0
_electronversion=40
pkgrel=1
pkgdesc="Allows you to expand and update the features of Mudita Pure and Mudita Harmony, while using your computer. One application for every platform, open-sourced for transparency.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://mudita.com/products/pure/"
_ghurl="https://github.com/mudita/mudita-center"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname// /-}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('659677f1ded4c267f8ae6f6a745572d2861cd7b7d128122e882740c0a3bb9e8e'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/squashfs-root/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-bin}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${_pkgname}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _get_electron_version
    sed -i -e "
        s/AppRun --no-sandbox /${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_pkgname}.desktop"
    rm -rf \
        "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/"\
            {android-*,darwin-*,linux-arm*,win32-*} \
        "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/usb/prebuilds/"\
            {android-*,darwin-*,linux-arm*,linux-ia32,win32-*}
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	find "${srcdir}/squashfs-root/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/squashfs-root/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/squashfs-root/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icon_sizes in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icon_sizes}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icon_sizes}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}