# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=soundcloud
pkgname="${_appname}-rpc-bin"
pkgver=0.0.9
_electronversion=24
pkgrel=1
pkgdesc="🎵 A SoundCloud Client with Discord Rich Presence, Dark Mode, Last.fm, and AdBlock Support.(Prebuilt version.Use system-wide electron)"
arch=('any')
url="https://github.com/richardhbtz/soundcloud-rpc"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-installer-linux.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/richardhbtz/soundcloud-rpc/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('13e59b0d03bb61c5b54932386831daaaaff0934ab4f90ac50772ccf0017c6d1f'
            'de7ae1038162d14df6bc9ec2a6f717a46d0c57deba4e4fffe4cea07595b0c68d'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}