# Maintainer: Nikolay Bryskin
pkgname=ppq-whisper-bin
_pkgname=ppq-whisper
pkgver=0.1.53
pkgrel=4
pkgdesc='PPQ Whisper (PPQ Voice) — cloud-powered desktop dictation app with instant clean-up'
arch=('x86_64')
url='https://github.com/PayPerQ/ppq-voice-releases'
license=('LicenseRef-proprietary')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'gtk3'
    'hicolor-icon-theme'
    'libnotify'
    'libsecret'
    'libxss'
    'libxtst'
    'nss'
    'util-linux-libs'
    'xclip'
    'xdg-utils'
    'xdotool'
)
optdepends=(
    'libappindicator-gtk3: tray icon support'
    'ydotool: paste keystroke via uinput, avoids the XTEST consent dialog and screen-control indicator on GNOME Wayland (enable the ydotool user service)'
)
makedepends=('asar')
provides=('ppq-whisper')
conflicts=('ppq-whisper')
options=(!strip !debug)
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb"
        'linux-clipboard.patch')
sha256sums=('bb2c11963db59e168ce49bada9a80b2516d23de043b878b2a169d16eaa713af2'
            '57ada7cc6f4c4dcb273e7dbfdff9610e5733659ca1eab8c5a3e9b8ec801c85f3')

package() {
    # electron-builder deb: app in "/opt/PPQ Whisper", desktop file + icon in /usr/share
    bsdtar -xf data.tar.xz -C "$pkgdir"

    # Unpack app.asar into resources/app (which Electron prefers over the
    # archive) so the Linux paste path can be patched: Electron's Wayland
    # clipboard silently drops writes while the window is unfocused, so the
    # dictated text never reached the real clipboard (see the patch header)
    local _res="$pkgdir/opt/PPQ Whisper/resources"
    asar extract "$_res/app.asar" "$_res/app"
    cp -a "$_res/app.asar.unpacked/." "$_res/app/"
    rm -r "$_res/app.asar" "$_res/app.asar.unpacked"
    patch -d "$_res/app" -Np1 < linux-clipboard.patch

    # electron-builder puts the icon in a bogus hicolor/0x0 dir; it is 256x256
    install -Dm644 "$pkgdir/usr/share/icons/hicolor/0x0/apps/$_pkgname.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
    rm -r "$pkgdir/usr/share/icons/hicolor/0x0"

    # Wrapper instead of the deb postinst's symlink:
    # - --gtk-version=3: Electron 36 auto-selects GTK4, but the tray/appindicator
    #   path still loads GTK3 symbols and GTK aborts on the mix ("GTK 2/3 symbols
    #   detected") before any window appears
    # - ozone auto + GlobalShortcutsPortal: on Wayland the app's push-to-talk
    #   hotkey (Electron globalShortcut) is an X11 grab that only fires while the
    #   app window is focused; native Wayland + the XDG GlobalShortcuts portal
    #   makes it session-wide (one-time GNOME approval). On X11 sessions ozone
    #   picks X11 and the portal flag is inert.
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$_pkgname" <<'WRAPPER'
#!/bin/sh
PATH="/usr/lib/ppq-whisper:$PATH"
export PATH
exec '/opt/PPQ Whisper/ppq-whisper' --gtk-version=3 \
    --ozone-platform-hint=auto --enable-features=GlobalShortcutsPortal "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/$_pkgname"

    # Route desktop launches through the wrapper too
    sed -i 's|^Exec=.*|Exec=ppq-whisper %U|' \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # The app pastes by spawning `xdotool key ctrl+v`; under XWayland that
    # XTEST call makes XWayland hold a libei remote-desktop session, giving a
    # consent dialog plus a persistent "screen is being controlled" indicator.
    # This shim on the wrapper's PATH injects through ydotoold (uinput,
    # KEY_LEFTCTRL=29 KEY_V=47) when it is running; the trailing sleep keeps
    # the shim alive so the app's clipboard restore (timed from process exit)
    # cannot outrun the paste target's clipboard fetch.
    install -d "$pkgdir/usr/lib/$_pkgname"
    cat > "$pkgdir/usr/lib/$_pkgname/xdotool" <<'SHIM'
#!/bin/sh
sock="${YDOTOOL_SOCKET:-${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/.ydotool_socket}"
if [ "$1" = key ] && [ "$2" = ctrl+v ] && [ -S "$sock" ] \
    && command -v ydotool >/dev/null 2>&1; then
    YDOTOOL_SOCKET="$sock" ydotool key 29:1 47:1 47:0 29:0
    status=$?
    sleep 0.4
    exit $status
fi
exec /usr/bin/xdotool "$@"
SHIM
    chmod 755 "$pkgdir/usr/lib/$_pkgname/xdotool"

    # SUID sandbox fallback for kernels without unprivileged user namespaces
    chmod 4755 "$pkgdir/opt/PPQ Whisper/chrome-sandbox"

    install -Dm644 "$pkgdir/opt/PPQ Whisper/LICENSE.electron.txt" \
        -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=4 sw=4 et:
