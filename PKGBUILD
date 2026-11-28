# Maintainer: Burak Seckin <rectfc@gmail.com>

pkgname=sidra-bin
pkgver=1.3.2
pkgrel=2
pkgdesc="An elegant Apple Music desktop client for Linux. No frippery, just quality."
arch=('x86_64')
url="https://github.com/wimpysworld/sidra"
license=('BlueOak-1.0.0')
# Matches upstream's own pacman target (build.pacman.depends in package.json)
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libgcc'
    'libnotify'
    'libpulse'
    'libsecret'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
    'util-linux'
    'xdg-utils'
)
optdepends=(
    'gnome-shell-extension-appindicator: system tray icon on GNOME'
    'playerctl: CLI media control via MPRIS'
    'pipewire-pulse: PipeWire audio backend'
    'pulseaudio: PulseAudio backend'
)
provides=('sidra')
conflicts=('sidra')
options=('!strip')

# AppImage artifact name has no version (see appImage.artifactName in package.json)
# The AppImage ships no copy of Sidra's own license, so fetch it from the tag
source=(
    "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/wimpysworld/sidra/${pkgver}/LICENSE"
)
source_x86_64=(
    "${pkgname}-${pkgver}.AppImage::https://github.com/wimpysworld/sidra/releases/download/${pkgver}/Sidra-linux-x86_64.AppImage"
)

sha256sums=('8a1af140fdfbf5afd3df27f7e662f989c5b963a300020dfafce42033cae9e004')
sha256sums_x86_64=('15616d82676f9b32a887ccd790cbd24c577e0627fd3b82cc2fca7addcc09ba73')

prepare() {
    cd "${srcdir}"
    
    _appimage="${pkgname}-${pkgver}.AppImage"

    chmod +x "${_appimage}"

    # Extract the AppImage — no FUSE required at build or install time
    "./${_appimage}" --appimage-extract
}

package() {
    cd "${srcdir}"

    # ── Application files ──────────────────────────────────────────────────────
    install -dm755 "${pkgdir}/opt/sidra"
    cp -a squashfs-root/. "${pkgdir}/opt/sidra/"

    # Remove redundant/extraneous files
    rm -f "${pkgdir}/opt/sidra/AppRun"
    rm -f "${pkgdir}/opt/sidra/.DirIcon"
    rm -f "${pkgdir}/opt/sidra/sidra.desktop"
    rm -f "${pkgdir}/opt/sidra/sidra.png"
    # Libraries bundled for AppRun's LD_LIBRARY_PATH; unused since we exec the binary directly
    rm -rf "${pkgdir}/opt/sidra/usr"

    # ── Wrapper script ─────────────────────────────────────────────────────────
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/sidra" << 'WRAPPER'
#!/bin/bash
# Wrapper for Sidra — Apple Music desktop client
exec /opt/sidra/sidra "$@"
WRAPPER
    chmod 755 "${pkgdir}/usr/bin/sidra"

    # ── Desktop entry ──────────────────────────────────────────────────────────
    _desktop="${pkgdir}/usr/share/applications/sidra.desktop"
    install -Dm644 squashfs-root/sidra.desktop "${_desktop}"

    # Point the main entry at the wrapper; the Desktop Action entries keep their dbus-send Exec
    sed -i "/^\[Desktop Entry\]/,/^\[/ s|^Exec=.*|Exec=/usr/bin/sidra %U|" "${_desktop}"
    # Ensure Icon is the bare name, not an absolute path
    sed -i "s|^Icon=.*|Icon=sidra|" "${_desktop}"

    # ── Icons ──────────────────────────────────────────────────────────────────
    # electron-builder populates usr/share/icons/hicolor inside the AppImage
    cp -a squashfs-root/usr/share/icons "${pkgdir}/usr/share/"
    # Fix directory permissions for icons (ensure they are world-readable)
    chmod -R u=rwX,go=rX "${pkgdir}/usr/share/icons"

    # ── License ────────────────────────────────────────────────────────────────
    # BlueOak-1.0.0 is not in Arch's common licenses, so the package must ship it
    install -Dm644 "${pkgname}-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # ── Fix permissions ────────────────────────────────────────────────────────
    chmod -R u=rwX,go=rX "${pkgdir}/opt/sidra/"
    chmod 755 "${pkgdir}/opt/sidra/sidra"
    # The chrome-sandbox binary must be owned by root and setuid
    if [[ -f "${pkgdir}/opt/sidra/chrome-sandbox" ]]; then
        chmod 4755 "${pkgdir}/opt/sidra/chrome-sandbox"
        chown root:root "${pkgdir}/opt/sidra/chrome-sandbox"
    fi
}
