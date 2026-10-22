# Maintainer: taxin-404 <taxin404@duck.com>
pkgname=affinity-bin
pkgver=3.3.1
pkgrel=1
pkgdesc="Affinity Photo/Designer/Publisher running via Wine (AppImage, unofficial - Serif is not affiliated)"
arch=('x86_64')
url="https://github.com/ryzendew/Linux-Affinity-Installer"
license=('custom')
options=('!strip' '!debug')  # AppImage = ELF stub + appended squashfs; stripping destroys it
depends=('fuse2' 'zenity')
optdepends=('opencl-driver: OpenCL acceleration (e.g. intel-compute-runtime)')
provides=('affinity')
conflicts=('affinity')
install=affinity-bin.install
# Assets embed Serif's own build number and a build suffix instead of just
# ${pkgver}: v3.3.0 was Affinity-3.3.0.4850-x86_64.AppImage, v3.3.1 is
# Affinity-3.3.1.4940-x86_64-optimized.AppImage. Re-check the release's asset
# list when bumping. The sha256 matches the digest GitHub publishes.
source=("${pkgname}-${pkgver}.AppImage::https://github.com/ryzendew/Linux-Affinity-Installer/releases/download/${pkgver}/Affinity-3.3.1.4940-x86_64-optimized.AppImage")
sha256sums=('bab79bdd10831864708decced0648da32234b7f54a1d99916c667dd0162144e3')

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
