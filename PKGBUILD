# Maintainer: qvshuo

_pkgname=yesplaymusic
pkgname=yesplaymusic-appimage
pkgver=0.3.8
pkgrel=1
pkgdesc="高颜值的第三方网易云播放器，支持 Windows / macOS / Linux。"
arch=('x86_64')
url="https://github.com/qier222/YesPlayMusic"
license=('MIT')
depends=( 'fuse')
options=(!strip)
_appimage="YesPlayMusic-${pkgver}.AppImage"
source=(${url}/releases/download/v${pkgver}/YesPlayMusic-${pkgver}.AppImage)
noextract=("${_appimage}")
sha512sums=('9bd303156f266070ce4c3cac69be5cba300583d8498450c6ff3283b2fef070568e6222d04aa29f343a50c6afae988f18c0f931280dd71f7082b312b41f157d86')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|" "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
