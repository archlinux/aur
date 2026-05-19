# Maintainer: Marcin Ufniarz <marcin at savvyworker dot com>
pkgname=savvy-mtg-life-counter-bin
pkgver=4.6.0
pkgrel=1
pkgdesc="Life counter and companion app for Magic: The Gathering"
arch=('x86_64')
url="https://lifecounter.savvyworker.com"
license=('LicenseRef-proprietary')
depends=('fuse2')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/mufniarz/savvy-mtg-life-counter-releases/releases/download/v${pkgver}/Savvy-MTG-Life-Counter-v${pkgver}-x86_64.AppImage")
sha256sums_x86_64=('a8b89b8f7d68ea3a6c7c4557f352f7fe3898c1ab6dd7c09fe5215a5273d88695')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    cd "${srcdir}"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null 2>&1
}

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
        "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Launcher wrapper in /usr/bin
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/savvy-mtg-life-counter" <<EOF
#!/bin/sh
exec /opt/${pkgname}/${pkgname}.AppImage "\$@"
EOF

    # Icons
    install -Dm644 \
        "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/savvy-mtg-life-counter.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/savvy-mtg-life-counter.png"

    # Desktop entry
    install -Dm644 \
        "${srcdir}/squashfs-root/usr/share/applications/savvy-mtg-life-counter.desktop" \
        "${pkgdir}/usr/share/applications/savvy-mtg-life-counter.desktop"

    # Licenses
    install -Dm644 \
        "${srcdir}/squashfs-root/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 \
        "${srcdir}/squashfs-root/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
