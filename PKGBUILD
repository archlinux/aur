# Maintainer: taxin <unknownbrofrombd@duck.com>
pkgname=affinity-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Affinity Photo/Designer/Publisher running via Wine (AppImage, unofficial - Serif is not affiliated)"
arch=('x86_64')
url="https://github.com/ryzendew/Linux-Affinity-Installer"
license=('custom')
options=('!strip' '!debug')  # AppImage = ELF stub + appended squashfs; stripping destroys it
depends=('fuse2' 'zenity')
provides=('affinity')
conflicts=('affinity')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/ryzendew/Linux-Affinity-Installer/releases/download/${pkgver}/Affinity-${pkgver}-x86_64.AppImage")
sha256sums=('32ac7f35834dad83cfa0b426571dea356be92f19f2b01eebd3139583395d516a')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    cd "${srcdir}"

    # Remove any leftover extraction from a previous build so
    # --appimage-extract doesn't choke on an existing squashfs-root
    # or create squashfs-root-1, squashfs-root-2, etc.
    rm -rf squashfs-root

    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract affinity.desktop
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract usr/share/icons/hicolor/scalable/apps/affinity.svg

    if [ ! -f "${srcdir}/squashfs-root/affinity.desktop" ]; then
        echo "ERROR: failed to extract affinity.desktop from the AppImage" >&2
        exit 1
    fi

    if [ ! -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/affinity.svg" ]; then
        echo "ERROR: failed to extract affinity.svg from the AppImage" >&2
        exit 1
    fi

    sed -i 's/A powerful affinity software\./A powerful Affinity application./' \
        "${srcdir}/squashfs-root/affinity.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
        "${pkgdir}/opt/affinity/affinity.AppImage"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/affinity/affinity.AppImage "${pkgdir}/usr/bin/affinity"

    install -Dm644 "${srcdir}/squashfs-root/affinity.desktop" \
        "${pkgdir}/usr/share/applications/affinity.desktop"

    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/affinity.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/affinity.svg"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
This package provides installation scripts/configuration for running the
proprietary Affinity software (by Serif (Europe) Ltd.) on Linux via Wine.

This project is not affiliated with, endorsed by, or associated with
Serif (Europe) Ltd. Users must have a valid Affinity license to use the
software installed by this package.

Upstream project: https://github.com/ryzendew/Linux-Affinity-Installer
EOF
}
