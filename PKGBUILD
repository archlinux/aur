# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=koharu-appimage
_pkgname=koharu
pkgver="0.53.0"
pkgrel=1
pkgdesc="ML-powered manga translator"
arch=('x86_64')
url='https://github.com/mayocream/koharu'
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'xdg-user-dirs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source_x86_64=("koharu_0.53.0_amd64.AppImage::https://github.com/mayocream/koharu/releases/download/0.53.0/koharu_0.53.0_amd64.AppImage")
sha512sums_x86_64=('7f4e0f99b19522f1beb01945cee34ebfb11b7968591faeb5bdc6666f602210e754b8a20fecf85e2c6a95abe2c9f2bce0594f6d06e63b23b1dc794b874c0672b8')
noextract=("koharu_${pkgver}_amd64.AppImage")

prepare() {
    chmod +x "${srcdir}/koharu_${pkgver}_amd64.AppImage"
    rm -rf "${srcdir}/squashfs-root"
    "${srcdir}/koharu_${pkgver}_amd64.AppImage" --appimage-extract

    sed -i -E "s|^Exec=.*|Exec=/usr/bin/${_pkgname}|" "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop"
    sed -i -E "s|^Icon=.*|Icon=${_pkgname}|" "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop"
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"

    install -Dm755 "${srcdir}/koharu_${pkgver}_amd64.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
}
