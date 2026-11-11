# Maintainer: Ackerman
pkgname=rootapp-bin
pkgver=0.9.163
pkgrel=4
pkgdesc="Root App is a new Discord alternative, designed for gaming communities and large online groups"
arch=('x86_64')
url="https://www.rootapp.com"
license=('LicenseRef-proprietary')
# deps re-derived from payload 2026-11-11 (DT_NEEDED union + ASCII/UTF-16 dlopen probes vs live core/extra .files indexes; libvlc, libspeechd.so.2, libcurl.so.4, liblivekit_ffi GPU probes all confirmed in shipped binaries)
depends=('alsa-lib'
         'at-spi2-core'
         'ca-certificates-mozilla'
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
         'openssl-3'
         'pango'
         'pciutils'
         'systemd-libs'
         'vulkan-icd-loader'
         'wayland'
         'xdg-utils')
provides=('rootapp')
conflicts=('rootapp')
optdepends=('xdg-desktop-portal: file-picker and screen-share dialogs'
            'xdg-desktop-portal-gnome: file-picker, settings and screen-share backend on GNOME'
            'xdg-desktop-portal-gtk: file-picker and settings backend on GTK desktops'
            'xdg-desktop-portal-kde: file-picker and screen-share backend on KDE Plasma'
            'xdg-desktop-portal-wlr: screen-share backend on wlroots compositors'
            'xdg-desktop-portal-hyprland: window and region screen share plus portal global shortcuts on Hyprland'
            'pipewire: PipeWire daemon that feeds the portal ScreenCast capture'
            'pipewire-pulse: PulseAudio-compatible server for voice and audio devices'
            'dunst: org.freedesktop.Notifications daemon for sessions without one'
            'gnome-shell-extension-appindicator: org.kde.StatusNotifierItem tray host on GNOME'
            'snixembed: StatusNotifierItem-to-XEmbed bridge for trays on minimal X11 sessions'
            'waybar: org.kde.StatusNotifierWatcher tray host on wlroots compositors'
            'speech-dispatcher: text-to-speech service for the Chromium libspeechd.so.2 probe (pulls libspeechd)'
            'libvlc: LibVLC runtime probed by the Root player (libvlc.so.5, libvlccore.so.9)'
            'vlc-plugin-ffmpeg: video and stream codecs for LibVLC playback (pulls libvlc)'
            'vlc-plugin-pulse: audio output for LibVLC playback on PipeWire and PulseAudio (pulls libvlc)'
            'curl: crash report uploads for the bundled Chromium crash handler (chrome_crashpad_handler dlopens libcurl.so.4)'
            'nvidia-utils: hardware video decode/encode on NVIDIA GPUs (provides libcuda.so.1, libnvcuvid.so.1, libnvidia-encode.so.1, libGLX_nvidia.so.0)')
options=('!strip' '!debug')

source=("Root-${pkgver}-x86_64.AppImage::https://installer.rootapp.com/installer/Linux/X64/Root.AppImage")
sha256sums=('af8ede1ca91a51e9f363e0e9f8229946412a98ac21ab13be272fbe7794f6a260')
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
    cat > "${pkgdir}/usr/bin/rootapp" <<'WRAPPER_EOF'
#!/bin/sh
set -eu
run="${XDG_DATA_HOME:-$HOME/.local/share}/rootapp-bin"
stamp=__STAMP__
mkdir -p "$run"
chmod 700 "$run" 2>/dev/null || true
if [ "$(cat "$run/.stamp" 2>/dev/null || true)" != "$stamp" ] || [ ! -x "$run/Root" ]; then
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

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Copyright 2026 RootApp

The Root desktop application is proprietary software. Redistribution of the
application itself is not permitted; this package repacks the upstream binary
for installation convenience.

Upstream: https://www.rootapp.com
EOF

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
