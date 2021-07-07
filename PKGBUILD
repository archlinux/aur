# Mantainer: Fabrizio Pietrucci <bamlessnty5@gmail.com>

_pkgname=hotspot
pkgname="${_pkgname}"-appimage
pkgver=1.3.0
pkgrel=1
pkgdesc="The Linux perf GUI for performance analysis."
arch=('x86_64')
url="https://github.com/KDAB/hotspot"
license=('GPL')
depends=('perf' 'fuse')
conflicts=(hotspot)
provides=(hotspot)
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"

noextract=("${_appimage}")
source=("${_appimage}::https://github.com/KDAB/hotspot/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64.AppImage")
sha256sums=('7d933e4e8dfe3894c244a74979eb1ad94bda109380398c532fb9ca7ef958c0eb')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    chmod -R a-x+rX squashfs-root/opt # Fix permissions
}

package() {
    # AppImage
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    cp -a "squashfs-root/opt/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
