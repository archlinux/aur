# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zyfun-bin
pkgver=3.4.3
_electronversion=40
pkgrel=1
pkgdesc="Cross-platform desktop video resource player, free high value.(Prebuilt version.Use system-wide electron)跨平台桌面端视频资源播放器,免费高颜值"
arch=(
    'aarch'
    'x86_64'
)
url="https://github.com/Hiram-Wong/zyfun"
license=("MIT")
provides=("${pkgname%-bin}-${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "zy-player"
    "zyplayer"
)
depends=(
    "electron${_electronversion}"
    'python'
    'python-requests'
    'python-lxml'
    'python-pyzmq'
    'python-pycryptodome'
)
source_aarch=("${pkgname%-bin}-${pkgver}-aarch.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-x86_64.rpm")
source=(
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/Hiram-Wong/zyfun/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch=('986cb57852500fd761ba0ef26bb641420d47604c93cc797714840b2c28d2a37d')
sha256sums_x86_64=('727e096fb790b4393bb8631b933784dbd90bb4be6c6f69e2449822f3016c3706')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\///g
        s/Audio;Video/AudioVideo/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    rm -rf \
        "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/7zip-bin-full/"{mac,win,linux/{arm,ia32}} \
        "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/zeromq/build/"{darwin,win32}
    case "${CARCH}" in
        aarch64)
            rm -rf \
                "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/7zip-bin-full/linux/x64" \
                "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/zeromq/build/linux/x64"
                ;;
        x86_64)
            rm -rf \
                "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/7zip-bin-full/linux/arm64" \
                "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked/node_modules/zeromq/build/linux/arm64"
                ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	find "${srcdir}/opt/${pkgname%-bin}/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/opt/${pkgname%-bin}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/opt/${pkgname%-bin}/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
