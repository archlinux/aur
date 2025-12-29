# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apiflow-bin
_pkgname=Apiflow
pkgver=0.9.0
_electronversion=36
pkgrel=1
pkgdesc="A modern API workspace that works both online and offline — combining API documentation, testing, mock, and AI-powered automation in one lightweight tool.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://apiflow.cn/"
_ghurl="https://github.com/trueleaf/apiflow"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    '7zip'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/trueleaf/apiflow/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/app-linux-v${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/app-linux-v${pkgver}.AppImage")
sha256sums=('dec165c0eb7d0f94e1dc6e4a5ef94e02581b37743fdc42c56116b984e41113f8'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('11f3d2e09dcb38447ef5658350e903d1ba11eb6f33bdc002a2457f7184d747de')
sha256sums_x86_64=('40e7ad61ca5cfded19045b8908528ed178955dfd330e6e69f5994653a5b2dc4d')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/squashfs-root/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
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
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _get_electron_version
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    #find "${srcdir}/squashfs-root/resources" -type d -perm 700 -exec chmod 755 {} +
    rm -rf \
        "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/"{mac,linux/{arm,ia32}} \
        "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/app-builder-bin/"{mac,linux/{arm,ia32,loong64,riscv64}}}
    case "${CARCH}" in
        aarch64)
            rm -rf \
                "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/linux/x64" \
                "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/app-builder-bin/x64"
            ln -sf "/usr/bin/7za" "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/linux/arm64/7za"
            ;;
        x86_64)
            rm -rf \
                "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/linux/arm64" \
                "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/app-builder-bin/arm64"
            ln -sf "/usr/bin/7za" "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/linux/x64/7za"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,icons} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}