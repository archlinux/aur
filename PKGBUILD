# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Maintainer: little_sheepycn <little_sheepycn@redstonebuild.onmicrosoft.com>
# Contributor: msojocs <jiyecafe@gmail.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: YidaozhanYa <yidaozhan_ya@outlook.com>
# Contributor: whitels <2959471117@qq.com>
# Contributor: wxt1221 <3264117476@qq.com>
# 感谢 Peternal 对 SVG图标 的授权
pkgname=bilibili-bin
_pkgver=1.17.1
_subver=3
pkgver="${_pkgver}_${_subver}"
_electronversion=28
epoch=5
pkgrel=3
pkgdesc="Bilibili official desktop client.(Prebuilt version.Use system-wide electron)哔哩哔哩官方客户端linux移植版。"
arch=(
    'aarch64'
    'x86_64'
)
url='https://github.com/msojocs/bilibili-linux'
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'ffmpeg'
    "electron${_electronversion}"
    'libappindicator-gtk3'
    'libinput'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${_pkgver}-${_subver}/${pkgname%-bin}-${_pkgver}.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${_pkgver}-${_subver}/${pkgname%-bin}-${_pkgver}.x86_64.rpm")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/msojocs/bilibili-linux/v${_pkgver}-${_subver}/license"
    "${pkgname%-bin}.sh"
)
sha256sums=('21668b8229199de1a523b82805c80d6e110a67fef5766aa7cc3c7df4416d1468'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('feb8804d137c9f941b8bfe4c48b82d59c95e2211856c61f164d7fb18c5e37a65')
sha256sums_x86_64=('198ce45c4d255699683cfbc7336a9876c2055ed2ca005c706dd8f0bc6250ee9f')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i "s/\/opt\/${pkgname%-bin}\///g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${pkgname%-bin}/resources/cursor-tool" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/resources/"{app,app.asar.unpacked} "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}