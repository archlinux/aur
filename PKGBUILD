# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=plexamp-bin
_pkgname=Plexamp
pkgver=4.12.0
_electronversion=28
pkgrel=1
pkgdesc="Modern music client for Plex.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://www.plex.tv/plexamp"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'pipewire-jack'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::https://plexamp.plex.tv/plexamp.plex.tv/desktop/${_pkgname}-${pkgver}.AppImage"
    "LICENSE.html::https://www.plex.tv/media-server-downloads/?cat=computer&plat=linux#remodal-terms"
    "${pkgname%-bin}.sh"
)
sha256sums=('3c1a51d14062e8b55e25478314ba16f9d6c5719c58af315131d9b3d737be87a2'
            'SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,treble} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/${pkgname%-bin}.svg" \
        -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}