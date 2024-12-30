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
pkgver=1.16.1_2
_electronversion=33
epoch=5
pkgrel=1
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
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-${pkgver%_2}.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-${pkgver%_2}.x86_64.rpm")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/msojocs/bilibili-linux/v${pkgver//_/-}/license"
    "${pkgname%-bin}.sh"
)
sha256sums=('21668b8229199de1a523b82805c80d6e110a67fef5766aa7cc3c7df4416d1468'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('35b217dae8eff860b094bc90f54cee4117260ede42251f6ba1a2a0cedb97d9da')
sha256sums_x86_64=('061c72ab5f7b6ef819223d6927ccf7c326991319e85664f13e622fa67433ff6d')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${pkgname%-bin}\/${pkgname%-bin}/${pkgname%-bin}/g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/resources/extensions" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}