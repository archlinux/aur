# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=houdunren-camera
pkgver=1.0.67
_electronversion=25
pkgrel=3
pkgdesc="Desktop camera software that can be used for online live streaming, distance learning, and video conferencing.桌面摄像头软件，可用于在线直播、远程教学、视频会议"
arch=('any')
url="https://www.houdunren.com/"
_ghurl="https://github.com/houdunwang/camera"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
mkdenpends=(
    'nodejs>=20'
    'pnpm'
    'gendesk'
    'npm'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '8e170ca0729ccdad6246cfae3c8ad35227a12fcc83574306e46d88b1d876c2c5')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    sed "s|@electronversion@|${_electronversion}|" -i "${srcdir}/${pkgname%-git}.sh"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed -e '/- snap/d' -e '/- deb/d' -i electron-builder.yml
    pnpm install
    pnpm build:linux
    cp "${srcdir}/${pkgname}-${pkgver}/dist/.icon-set/icon_16x16.png" "${srcdir}/${pkgname}-${pkgver}/dist/.icon-set/icon_16.png"
    cp "${srcdir}/${pkgname}-${pkgver}/dist/.icon-set/icon_48x48.png" "${srcdir}/${pkgname}-${pkgver}/dist/.icon-set/icon_48.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" \
        -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked/resources/"* \
        -t "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/resources"
    for _icons in 16 32 48 64 128 256 512 1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}