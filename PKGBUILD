# Maintainer: Jan Damek <jan@damek-soft.eu>
#
# WARNING: This is a third-party Discord client. Use at your own risk.
# Discord ToS prohibits third-party user clients. Account suspension risk.
# See: https://github.com/JanDamek/puklic#%EF%B8%8F-disclaimer

pkgname=puklic-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight native Discord client (Compose Multiplatform, Kotlin Multiplatform)"
arch=('x86_64')
url="https://github.com/JanDamek/puklic"
license=('GPL3')
depends=('libsecret' 'libdbus' 'java-runtime>=21')
optdepends=(
    'libayatana-appindicator: System tray icon support'
    'pipewire: Voice chat audio backend'
    'xdg-desktop-portal: Screen sharing on Wayland'
    'wl-clipboard: Wayland clipboard support'
)
provides=("puklic=${pkgver}")
conflicts=('puklic')

source=("puklic_${pkgver}_amd64.deb::https://github.com/JanDamek/puklic/releases/download/v${pkgver}/puklic_${pkgver}-1_amd64.deb")
sha256sums=('20225457d9023d68dac8078097dabbf627a914c1dd78df06ae520969d526a279')

install="${pkgname}.install"

package() {
    cd "$srcdir"
    # Extract .deb (Debian package = ar archive containing data.tar.zst)
    ar x "puklic_${pkgver}_amd64.deb"
    tar -xf data.tar.* -C "$pkgdir"
    # Cleanup: remove .deb-specific paths if any
    rm -rf "$pkgdir/DEBIAN" || true

    # FHS integration (issue #20 reopen). Compose Desktop / jpackage ships
    # everything under /opt/puklic/ and does NOT expose the binary on PATH or
    # the .desktop entry / icon in the standard XDG locations. Bridge that
    # gap here so `puklic` works from the shell and the app appears in menus.
    #
    # NOTE: from v0.1.1 onwards the upstream .deb is patched at build time
    # (desktop/app/build.gradle.kts :: patchDebPostBuild) so these steps are
    # idempotent — re-creating already-correct symlinks is a no-op.

    # Lowercase /usr/bin/puklic launcher (Arch convention: lowercase binaries).
    install -d "$pkgdir/usr/bin"
    ln -sf /opt/puklic/bin/Puklic "$pkgdir/usr/bin/puklic"

    # Standard .desktop location with absolute Exec and themed Icon name.
    install -d "$pkgdir/usr/share/applications"
    if [ -f "$pkgdir/opt/puklic/lib/puklic-Puklic.desktop" ]; then
        install -m 644 "$pkgdir/opt/puklic/lib/puklic-Puklic.desktop" \
            "$pkgdir/usr/share/applications/puklic.desktop"
        sed -i 's|^Exec=.*|Exec=/opt/puklic/bin/Puklic|' \
            "$pkgdir/usr/share/applications/puklic.desktop"
        sed -i 's|^Icon=.*|Icon=puklic|' \
            "$pkgdir/usr/share/applications/puklic.desktop"
    fi

    # Standard icon location (pixmaps fallback — works without theme refresh).
    install -d "$pkgdir/usr/share/pixmaps"
    if [ -f "$pkgdir/opt/puklic/lib/Puklic.png" ]; then
        install -m 644 "$pkgdir/opt/puklic/lib/Puklic.png" \
            "$pkgdir/usr/share/pixmaps/puklic.png"
    fi
}
