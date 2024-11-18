# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nipaplay-bin
_pkgname=NipaPlay
pkgver=1.6.13
_electronversion=29
pkgrel=1
pkgdesc="Local bullet screen video player. Play the Meal Replacement.(Prebuilt version.Use system-wide electron)一款本地弹幕视频播放器."
arch=('x86_64')
url="https://github.com/MCDFsteve/NipaPlay"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('4290fa556939fb541483cf6e8e3575f378d07d42560a76a4b787f1d0dfda8fa8'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    rm -rf "${srcdir}/resources/app/ffmpeg/ffmpeg_linuxarm"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
   cp -Pr --no-preserve=ownership "${srcdir}/resources/app"  "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/resources/app/others/社区图标.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
