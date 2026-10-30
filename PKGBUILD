# Maintainer: Ackerman
pkgname=rootapp-bin
pkgver=0.9.157
pkgrel=2
pkgdesc="Root App is a new Discord alternative, designed for gaming communities and large online groups"
arch=('x86_64')
url="https://www.rootapp.com"
license=('LicenseRef-proprietary')
# depends: DT_NEEDED of all 18 ELFs plus by-name dlopen probes, resolved in core+extra (2026-10-30).
depends=('alsa-lib'
         'at-spi2-core'
         'cairo'
         'dbus'
         'expat'
         'fontconfig'
         'glib2'
         'gtk3'
         'hicolor-icon-theme'
         'krb5'
         'libcups'
         'libgcc'
         'libglvnd'
         'libice'
         'libpipewire'
         'libpulse'
         'libsm'
         'libstdc++'
         'libva'
         'libx11'
         'libxcb'
         'libxcomposite'
         'libxcursor'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxi'
         'libxinerama'
         'libxkbcommon'
         'libxkbcommon-x11'
         'libxrandr'
         'libxss'
         'libxt'
         'libxtst'
         'mesa'
         'nspr'
         'nss'
         'openssl'
         'pango'
         'pciutils'
         'systemd-libs'
         'vulkan-icd-loader'
         'wayland'
         'xdg-utils')
provides=('rootapp')
conflicts=('rootapp')
# optdepends: D-Bus probes in dbus-monitor --session, the LibVLC P/Invoke table and the
# chromium WebRTCPipeWireCapturer command line (2026-10-30).
optdepends=('xdg-desktop-portal: file-picker and screen-share dialogs'
            'xdg-desktop-portal-gnome: file-picker, settings and screen-share backend on GNOME'
            'xdg-desktop-portal-gtk: file-picker and settings backend on GTK desktops'
            'xdg-desktop-portal-kde: file-picker and screen-share backend on KDE Plasma'
            'xdg-desktop-portal-wlr: screen-share backend on wlroots compositors'
            'pipewire: PipeWire daemon that feeds the portal ScreenCast capture'
            'pipewire-pulse: PulseAudio-compatible server for voice and audio devices'
            'gamemode: GameMode daemon for performance mode during calls and streams'
            'vlc-plugin-ffmpeg: video and stream playback through LibVLC'
            'vlc-plugin-pulse: audio output for LibVLC playback on PipeWire and PulseAudio')
options=('!strip' '!debug')

source=("Root-${pkgver}-x86_64.AppImage::https://installer.rootapp.com/installer/Linux/X64/Root.AppImage"
        'LICENSE')
sha256sums=('573f7bbb18ae5ebe9ae8bfcbda4ce93c35f404c9066c62bb716eb5d3115ba2cb'
            '8826596bcd18e3b9019b7bc065a0d22429e7447b2940c64ce500c22c7746a93e')
prepare() {
    chmod +x "${srcdir}/Root-${pkgver}-x86_64.AppImage"
    "${srcdir}/Root-${pkgver}-x86_64.AppImage" --appimage-extract
    chmod go-w squashfs-root

    shipped=$(sed -n 's/^X-AppImage-Version=//p' "${srcdir}"/squashfs-root/*.desktop | head -n 1)
    if [ "$shipped" != "$pkgver" ]; then
        printf 'payload is version %s, pkgver is %s\n' "${shipped:-unknown}" "$pkgver" >&2
        return 1
    fi
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"
    chmod 755 "${pkgdir}/opt/${pkgname}/AppRun"

    rm -f "${pkgdir}/opt/${pkgname}/usr/bin/Root.dbg"

    if [ ! -x "${pkgdir}/opt/${pkgname}/usr/bin/Root" ]; then
        printf 'payload has no executable usr/bin/Root, the wrapper would exec nothing\n' >&2
        return 1
    fi

    install -dm755 "${pkgdir}/usr/bin"
    # Payload mkdirs "Root Communications", "Sentry" and ".sentry-native" beside its exe and
    # exits 0 when that fails, so it needs a user-writable runtime dir (strace, 2026-10-29).
    cat > "${pkgdir}/usr/bin/rootapp" <<'WRAPPER_EOF'
#!/bin/sh
set -eu
run="${XDG_DATA_HOME:-$HOME/.local/share}/rootapp-bin"
stamp=__STAMP__
mkdir -p "$run"
chmod 700 "$run" 2>/dev/null || true
if [ "$(cat "$run/.stamp" 2>/dev/null || true)" != "$stamp" ]; then
    cp --reflink=auto "/opt/rootapp-bin/usr/bin/Root" "$run/Root.part"
    chmod 755 "$run/Root.part"
    mv -f "$run/Root.part" "$run/Root"
    for entry in /opt/rootapp-bin/usr/bin/*; do
        name=${entry##*/}
        [ "$name" = Root ] || ln -sfn "$entry" "$run/$name"
    done
    printf '%s\n' "$stamp" > "$run/.stamp"
fi
exec "$run/Root" "$@"
WRAPPER_EOF
    sed -i "s/__STAMP__/${pkgver}-${pkgrel}/" "${pkgdir}/usr/bin/rootapp"
    if grep -q '__STAMP__' "${pkgdir}/usr/bin/rootapp"; then
        printf 'unstamped wrapper would recopy the payload on every launch\n' >&2
        return 1
    fi
    chmod 755 "${pkgdir}/usr/bin/rootapp"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/pixmaps/rootapp.png"
    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/rootapp.png"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/rootapp-app.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Root
Comment=Root App is a new Discord alternative, designed for gaming communities and large online groups
Exec=rootapp %U
Icon=rootapp
Terminal=false
StartupWMClass=Root
Categories=Network;InstantMessaging;
MimeType=x-scheme-handler/rootapp;
EOF
}
