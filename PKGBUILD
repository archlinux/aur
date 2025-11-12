# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=issie-bin
pkgver=5.11.0
_electronversion=35
pkgrel=1
pkgdesc="An intuitive cross-platform hardware design application."
arch=(
    'aarch64'
    'x86_64'
)
url="https://tomcl.github.io/issie"
_ghurl="https://github.com/tomcl/issie"
license=('GPL-3.0-only')
conflits=("${pkgname%-bin}")
depends=(
    'gtk3'
    'alsa-lib'
    'nss'
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.zip")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-5.10.3-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-5.10.3-linux-x64.zip")
sha256sums_aarch64=('1c43b20b877db740ed0bc5515d6364da09921e5fd1265cf4f73202f7ea4a78d9')
sha256sums_x86_64=('ff94105afdda391b3a6aca9814dab26bed9509bc6dc9e6f011f125c74fa51145')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    _get_electron_version
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome_crashpad_handler chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
        libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
    for _files in "${_file_list[@]}";do
        rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/${_files}"
        ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${srcdir}/usr/lib/${pkgname%-bin}/${_files}"
    done
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin} --no-sandbox %U"
    rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/usb/prebuilds/"{android-*,darwin-*,win32-*}
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/usb/prebuilds/"{linux-arm,linux-ia32,linux-x64}
            ;;
        x86_64)
            rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/usb/prebuilds/"{linux-arm*,linux-ia32}
            ;;
    esac
}
package() {
    cp -r "${srcdir}/usr" "${pkgdir}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/static/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
