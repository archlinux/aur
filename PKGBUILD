# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=koharu-appimage
_pkgname=koharu
pkgver="0.47.1"
pkgrel=1
pkgdesc="ML-powered manga translator"
arch=('x86_64')
url='https://github.com/mayocream/koharu'
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'xdg-user-dirs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source_x86_64=("koharu_0.47.1_amd64.AppImage::https://github.com/mayocream/koharu/releases/download/0.47.1/koharu_0.47.1_amd64.AppImage")
sha512sums_x86_64=('558d656d05fb2d407c483f32d2228b1858dedb2c40b3d797a357c96a760e7f629048e96b206be4f0e3cfc7c5a606702f70f9105b56b4bcfac21cf1462a072994')
noextract=("koharu_${pkgver}_amd64.AppImage")

prepare() {
    chmod +x "${srcdir}/koharu_${pkgver}_amd64.AppImage"
    rm -rf "${srcdir}/squashfs-root"
    "${srcdir}/koharu_${pkgver}_amd64.AppImage" --appimage-extract

    sed -i -E "s|^Exec=.*|Exec=/usr/bin/${_pkgname}|" "${srcdir}/squashfs-root/io.github.mayocream.koharu.desktop"
    sed -i -E "s|^Icon=.*|Icon=${_pkgname}|" "${srcdir}/squashfs-root/io.github.mayocream.koharu.desktop"
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

    install -Dm755 "${srcdir}/koharu_${pkgver}_amd64.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/squashfs-root/io.github.mayocream.koharu.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/koharu.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}