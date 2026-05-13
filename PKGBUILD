# Maintainer: Burak Seckin <rectfc@gmail.com>

pkgname=sidra-bin
pkgver=0.3.3
pkgrel=4
pkgdesc="An elegant Apple Music desktop client for Linux. No frippery, just quality."
arch=('x86_64')
url="https://github.com/wimpysworld/sidra"
license=('BlueOak-1.0.0')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'dbus'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libdrm'
    'libnotify'
    'libsecret'
    'libx11'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxrandr'
    'libxtst'
    'mesa'
    'nspr'
    'nss'
)
optdepends=(
    'libappindicator-gtk3: system tray / indicator icon support'
    'playerctl: CLI media control via MPRIS'
    'pipewire: PipeWire audio backend'
    'pulseaudio: PulseAudio backend'
    'xdg-utils: open links in the default browser'
)
provides=('sidra')
conflicts=('sidra')
options=('!strip')

# AppImage artifact name has no version (see appImage.artifactName in package.json)
source_x86_64=(
    "${pkgname}-${pkgver}.AppImage::https://github.com/wimpysworld/sidra/releases/download/${pkgver}/Sidra-linux-x86_64.AppImage"
)

sha256sums_x86_64=('bccbd84242edbc9e8d4744e3e0796aad65b87538475635a2066456db28e321df')

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
    if [[ -f "squashfs-root/usr/share/applications/sidra.desktop" ]]; then
        install -Dm644 squashfs-root/usr/share/applications/sidra.desktop \
            "${_desktop}"
    else
        # Fallback if electron-builder placed it at the AppImage root
        install -Dm644 squashfs-root/sidra.desktop "${_desktop}" 2>/dev/null || \
        cat > "${_desktop}" << 'DESKTOP'
[Desktop Entry]
Name=Sidra
Comment=An elegant Apple Music desktop client
Exec=/usr/bin/sidra %U
Icon=sidra
Terminal=false
Type=Application
Categories=AudioVideo;Audio;Music;Player;
MimeType=x-scheme-handler/itms;
StartupWMClass=Sidra
DESKTOP
    fi

    # Rewrite Exec so it always points to the wrapper
    sed -i "s|^Exec=.*|Exec=/usr/bin/sidra %U|" "${_desktop}"
    # Ensure Icon is the bare name, not an absolute path
    sed -i "s|^Icon=.*|Icon=sidra|" "${_desktop}"

    # ── Icons ──────────────────────────────────────────────────────────────────
    # electron-builder populates usr/share/icons/hicolor inside the AppImage
    if [[ -d "squashfs-root/usr/share/icons" ]]; then
        cp -a squashfs-root/usr/share/icons "${pkgdir}/usr/share/"
    fi

    # Also install any PNG at the AppImage root as a fallback
    for _size in 16 32 48 64 128 256 512; do
        if [[ -f "squashfs-root/${_size}x${_size}.png" ]]; then
            install -Dm644 "squashfs-root/${_size}x${_size}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/sidra.png"
        fi
    done
    if [[ -f "squashfs-root/sidra.png" ]]; then
        install -Dm644 squashfs-root/sidra.png \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/sidra.png"
    fi

    # ── License ────────────────────────────────────────────────────────────────
    # Install custom license (BlueOak-1.0.0)
    # Check common locations/names for the license file
    for _license in LICENSE LICENSE.md LICENSE.txt; do
        if [[ -f "squashfs-root/${_license}" ]]; then
            install -Dm644 "squashfs-root/${_license}" \
                "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
            break
        fi
    done

    # ── Fix permissions ────────────────────────────────────────────────────────
    chmod -R u=rwX,go=rX "${pkgdir}/opt/sidra/"
    chmod 755 "${pkgdir}/opt/sidra/sidra"
    # The chrome-sandbox binary must be owned by root and setuid
    if [[ -f "${pkgdir}/opt/sidra/chrome-sandbox" ]]; then
        chmod 4755 "${pkgdir}/opt/sidra/chrome-sandbox"
        chown root:root "${pkgdir}/opt/sidra/chrome-sandbox"
    fi
}
