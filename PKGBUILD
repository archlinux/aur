# Maintainer: Ahmet Diler <ahmet.diler@hotmail.de>
pkgname=md-viewer-bin
pkgver=0.3.13
pkgrel=1
pkgdesc="Fast, lightweight markdown viewer with LaTeX math, mermaid diagrams, tabs, file explorer and live reload (prebuilt binary)"
arch=('x86_64')
url="https://github.com/aydiler/md-viewer"
license=('MIT')
# Runtime deps are kept identical to md-viewer-git. ldd on the binary only
# shows libc/libm/libgcc_s linked directly; the rest is dlopen'd at runtime,
# so ldd cannot validate the dep set: libxcb/libxkbcommon by winit,
# fontconfig by the font loader, and libdbus (package dbus) by rfd's
# xdg-desktop-portal file dialog. openssl and gtk3 are not used (devlog 099).
depends=(
    'gcc-libs'
    'libxcb'
    'libxkbcommon'
    'fontconfig'
    'dbus'
)
optdepends=(
    'zenity: native file dialogs'
    'xdg-desktop-portal: file dialogs on Wayland'
    'xdg-desktop-portal-gtk: GTK portal backend'
)
provides=('md-viewer')
conflicts=('md-viewer' 'md-viewer-git')
# Every local name carries ${pkgver}. makepkg reuses a source file that is
# already in the build directory instead of downloading it, and AUR helpers
# keep that directory between upgrades, so a fixed name serves the previous
# version's copy once the file changes upstream and the checksum fails (#282).
source=(
    "md-viewer-${pkgver}-linux-x86_64.tar.gz::https://github.com/aydiler/md-viewer/releases/download/v${pkgver}/md-viewer-${pkgver}-linux-x86_64.tar.gz"
    "md-viewer-${pkgver}.desktop::https://raw.githubusercontent.com/aydiler/md-viewer/v${pkgver}/data/md-viewer.desktop"
    "md-viewer-${pkgver}.png::https://raw.githubusercontent.com/aydiler/md-viewer/v${pkgver}/data/io.github.aydiler.md-viewer.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/aydiler/md-viewer/v${pkgver}/LICENSE"
    "THIRD_PARTY_NOTICES-${pkgver}::https://raw.githubusercontent.com/aydiler/md-viewer/v${pkgver}/THIRD_PARTY_NOTICES"
)
sha256sums=(
    '2eaef9dc29cd5feeeddb1d576c473d4495cdb3eb901d99410ce7d8a3f56ab20f'
    '7d786706389bf20531f1e2ace18bc1d2057b1745c059df6e804695cbbc8fe69c'
    '46d7a5b2a50e845d8c63146441914d37df5c411036a22d5412f1844126330b1b'
    '1a12042bdcb8eb609fd272b10a1dac618aec3aebdae90f5dd49af264a358444e'
    '780a707ff437566027cde3d1ab95d57bc6c2eee03233b8cde95daeeb21bae8e0'
)

package() {
    install -Dm755 "${srcdir}/md-viewer" \
        "${pkgdir}/usr/bin/md-viewer"
    install -Dm644 "${srcdir}/md-viewer-${pkgver}.desktop" \
        "${pkgdir}/usr/share/applications/md-viewer.desktop"
    install -Dm644 "${srcdir}/md-viewer-${pkgver}.png" \
        "${pkgdir}/usr/share/pixmaps/io.github.aydiler.md-viewer.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/THIRD_PARTY_NOTICES-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES"
}
