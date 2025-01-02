# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ffbox-bin
_pkgname=FFBox
pkgver=4.3
_electronversion=24
pkgrel=1
pkgdesc="An user-friendly ffmpeg GUI.(Prebuilt version.Use system-wide electron)一个多媒体转码百宝箱/一个 FFmpeg 的套壳"
arch=('x86_64')
url="https://github.com/ttqftech/FFBox"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Linux_${CARCH//_/-}_${_pkgname}_${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ttqftech/FFBox/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('d043127210162aa99f113f2cb3eef3a6bfa4fcd3e622f5e1f602304e161d9cb5'
            '67ed2b6388724e58664564bf21e73eb1e00dbfe513c70fff71f20517e38dfbca'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed -i "
        s/process.resourcesPath/\"\/usr\/lib\/${pkgname%-bin}\"/g
        s/process.execPath,\"..\/FFBoxService\"/\"\/usr\/lib\/${pkgname%-bin}\",\"FFBoxService\"/g
    " -i "${srcdir}/opt/${_pkgname}/resources/app/app/main/index.cjs"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_pkgname}/FFBoxService" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership  "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}