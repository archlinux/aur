# Maintainer: MiguVT <contacto@miguvt.com>

pkgname=silverr-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="Silverr application"
arch=('x86_64')
url="https://github.com/Wookhq/silverr"
license=('LicenseRef-proprietary')
depends=('fuse2' 'hicolor-icon-theme')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/Wookhq/silverr/releases/download/v${pkgver}-alpha/Silverr-${pkgver}.AppImage")
sha256sums=('f2f34a37b597d0686baf7d054de83f1f659889b0319df8469bb92effaf2b3e07')

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/silverr"

    if [[ -f "${srcdir}/squashfs-root/silverr.desktop" ]]; then
        install -Dm644 "${srcdir}/squashfs-root/silverr.desktop" "${pkgdir}/usr/share/applications/silverr.desktop"
        sed -i "s|Exec=.*|Exec=/usr/bin/silverr|g" "${pkgdir}/usr/share/applications/silverr.desktop"
    fi

    install -Dm644 "${srcdir}/squashfs-root/silverr.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/silverr.svg"
}
