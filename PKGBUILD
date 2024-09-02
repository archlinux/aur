# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=animeclient-bin
_pkgname=AnimeClient
pkgver=2.1.1
_electronversion=31
pkgrel=1
pkgdesc="An application that brings together several anime streaming platforms"
arch=('x86_64')
url="https://animeclient.zvbt.space/"
_ghurl="https://github.com/zvbt/AnimeClient"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    #"electron${_electronversion}"
    'gtk3'
    'alsa-lib'
    'at-spi2-core'
    'nss'
    'nspr'
    'gtk2'
    'libdbusmenu-glib'
    'dbus-glib'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Setup_${pkgver}.AppImage"
    #"${pkgname%-bin}.sh"
)
sha256sums=('da2b3627bd6dcea3af228b7d195198b30da8e1c4847c777936d5b0173679da25')
build() {
    #sed -e "s|@electronversion@|${_electronversion}|g" \
    #    -e "s|@appname@|${pkgname%-bin}|g" \
    #    -e "s|@runname@|app.asar|g" \
    #    -e "s|@cfgdirname@|${pkgname%-bin}|g" \
    #    -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
    #    -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/" -type d -exec chmod 755 {} \;
}
package() {
    #install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/AppRun" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}