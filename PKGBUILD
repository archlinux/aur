# Maintainer: delta-whiplash <delta@delta-net.ovh>

pkgname=bitchord-bin
_appname=BitChord
pkgver=1.8
pkgrel=5
pkgdesc="A modern YouTube Music client with clean aesthetics inspired by Apple Music (prebuilt)"
arch=('x86_64')
url="https://github.com/kushagrasinghx/BitChord"
license=('GPL-3.0-only')
depends=('glibc' 'jq')
makedepends=('imagemagick')
optdepends=('libnotify: notification when launching while an instance is already running'
            'kscreen: KDE Wayland monitor-scale detection for HiDPI'
            'mpv: alternative media backend')
provides=('bitchord')
conflicts=('bitchord')
options=('!strip')

source=(
    "${_appname}-${pkgver}-linux-amd64.deb::https://github.com/kushagrasinghx/BitChord/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/kushagrasinghx/BitChord/main/LICENSE"
)
sha256sums=('b5ac5b568015720ada47f378263e83c7dd6d8232d95fc26ddeb4bd1651db1a54'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

# The deb is a self-contained jpackage image: /opt/bitchord/{bin,lib}
# with a bundled jlink runtime, so no Java dependency is required.
prepare() {
    bsdtar -xf "${_appname}-${pkgver}-linux-amd64.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${srcdir}"
}

package() {
    # ---- Application tree ---------------------------------------
    install -dm755 "${pkgdir}/opt"
    cp -a "${srcdir}/opt/bitchord" "${pkgdir}/opt/bitchord"

    # ---- Wrapper in PATH ----------------------------------------
    # Desktop-agnostic: every integration below is optional and guarded —
    # on GNOME/KDE (which scale XWayland themselves) the wrapper does
    # nothing beyond launching; on compositors without XSettings
    # (Hyprland, Sway, ...) it detects the monitor scale and passes it to
    # AWT via sun.java2d.uiScale (fractional-capable, unlike GDK_SCALE
    # which is integer-only), so the app renders at the right size.
    # A user-set GDK_SCALE or uiScale always takes precedence.
    #
    # Single-instance: the jpackage launcher is a plain JVM starter with
    # no activation mechanism, so every invocation would spawn a second
    # instance. If one is already running, try to focus its window
    # (best-effort, Hyprland) and exit.
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/bitchord" <<'EOF'
#!/bin/sh
if _pid=$(pgrep -x BitChord | head -n1) && [ -n "$_pid" ]; then
    if command -v hyprctl >/dev/null 2>&1 && hyprctl dispatch focuswindow "pid:$_pid" >/dev/null 2>&1; then
        :
    else
        notify-send "BitChord" "Already running." 2>/dev/null \
            || echo "BitChord is already running (pid $_pid)." >&2
    fi
    exit 0
fi
if [ -z "$GDK_SCALE" ] && [ -z "$JAVA_TOOL_OPTIONS" ] && ! echo "$JDK_JAVA_OPTIONS $_JAVA_OPTIONS" | grep -q uiScale; then
    _scale=""
    if command -v hyprctl >/dev/null 2>&1 && hyprctl monitors >/dev/null 2>&1; then
        _scale=$(hyprctl -j monitors 2>/dev/null | jq -r '[.[] | select(.focused == true) | .scale] | first // empty' 2>/dev/null)
    elif command -v swaymsg >/dev/null 2>&1 && swaymsg -t get_outputs >/dev/null 2>&1; then
        _scale=$(swaymsg -t get_outputs 2>/dev/null | jq -r '[.[] | select(.focused == true) | .scale] | first // empty' 2>/dev/null)
    elif command -v kscreen-doctor >/dev/null 2>&1; then
        # KDE Wayland; timeout guards against missing kscreen daemon
        _scale=$(timeout 2 kscreen-doctor -o 2>/dev/null | grep -om1 'scale [0-9.]*' | cut -d' ' -f2)
    fi
    case "$_scale" in ''|null|1) ;; *) export JAVA_TOOL_OPTIONS="-Dsun.java2d.uiScale=$_scale" ;; esac
fi
exec /opt/bitchord/bin/BitChord "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/bitchord"

    # ---- .desktop file ------------------------------------------
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/bitchord.desktop" <<EOF
[Desktop Entry]
Name=BitChord
Comment=A modern YouTube Music client with clean aesthetics inspired by Apple Music
Exec=/usr/bin/bitchord
Icon=bitchord
Terminal=false
Type=Application
Categories=Audio;AudioVideo;Music;
EOF

    # ---- Icon ---------------------------------------------------
    # Ship every standard hicolor size: some icon resolvers ignore
    # non-standard directories like 1024x1024 (observed as a placeholder
    # icon in launchers and tray menus).
    _icon="${srcdir}/opt/bitchord/lib/BitChord.png"
    install -Dm644 "$_icon" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/bitchord.png"
    for _s in 16 24 32 48 64 128 256 512; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps"
        magick "$_icon" -resize "${_s}x${_s}" \
            "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/bitchord.png"
        chmod 644 "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/bitchord.png"
    done

    # ---- License ------------------------------------------------
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
