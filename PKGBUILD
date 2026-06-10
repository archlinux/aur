# Maintainer: Crosery <luoxi2024@gmail.com>

pkgname=tokenicode-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A beautiful desktop client for Claude Code — Tauri 2 + React 19 (with fcitx5 input method support)"
arch=('x86_64')
url="https://github.com/yiliqi78/TOKENICODE"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'gdk-pixbuf2' 'cairo' 'pango' 'gst-plugins-base' 'gst-plugins-good' 'libayatana-appindicator' 'libsoup3')
optdepends=('fcitx5-gtk: fcitx5 input method support')
provides=('tokenicode')
conflicts=('tokenicode')
options=('!strip' '!debug')
install="${pkgname}.install"
source=("TOKENICODE_${pkgver}_amd64.AppImage::https://github.com/yiliqi78/TOKENICODE/releases/download/v${pkgver}/TOKENICODE_${pkgver}_amd64.AppImage"
        "${pkgname}.install")
sha256sums=('55f4022d158cb0367fded35bf28638b0b4975ebfee149591916c8953f42dcec2'
            'SKIP')
noextract=("TOKENICODE_${pkgver}_amd64.AppImage")

prepare() {
    chmod +x "${srcdir}/TOKENICODE_${pkgver}_amd64.AppImage"
    "${srcdir}/TOKENICODE_${pkgver}_amd64.AppImage" --appimage-extract >/dev/null 2>&1
}

package() {
    local _appdir="${srcdir}/squashfs-root"

    # Install main binary
    install -Dm755 "${_appdir}/usr/bin/tokenicode" "${pkgdir}/opt/${pkgname}/tokenicode"

    # Install bundled libraries
    if [ -d "${_appdir}/usr/lib" ]; then
        cp -a "${_appdir}/usr/lib" "${pkgdir}/opt/${pkgname}/"
    fi

    # Create launcher script with fcitx5 support
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/tokenicode" << 'LAUNCHER'
#!/bin/bash

# fcitx5 input method support for GTK3/WebKitGTK apps
if command -v fcitx5 >/dev/null 2>&1 || pgrep -x fcitx5 >/dev/null 2>&1; then
    export GTK_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx

    # Use system immodules cache if fcitx5-gtk is installed
    FCITX5_SO="/usr/lib/gtk-3.0/3.0.0/immodules/im-fcitx5.so"
    if [ -f "$FCITX5_SO" ]; then
        export GTK_PATH="/usr/lib/gtk-3.0:/opt/tokenicode-bin/lib/gtk-3.0:/usr/lib64/gtk-3.0"

        # Generate immodules cache if needed
        CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/tokenicode"
        CACHE_FILE="${CACHE_DIR}/immodules.cache"
        if [ ! -f "$CACHE_FILE" ] || [ "$FCITX5_SO" -nt "$CACHE_FILE" ]; then
            mkdir -p "$CACHE_DIR"
            gtk-query-immodules-3.0 2>/dev/null > "$CACHE_FILE"
        fi
        export GTK_IM_MODULE_FILE="$CACHE_FILE"
    fi
fi

# GDK backend - prefer x11 for better input method compatibility
if [ -n "$WAYLAND_DISPLAY" ] && [ "$GDK_BACKEND" != "x11" ]; then
    export GDK_BACKEND=x11
fi

exec /opt/tokenicode-bin/tokenicode "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/tokenicode"

    # Install desktop entry
    if [ -f "${_appdir}/tokenicode.desktop" ]; then
        install -Dm644 "${_appdir}/tokenicode.desktop" \
            "${pkgdir}/usr/share/applications/tokenicode.desktop"
        sed -i 's|^Exec=.*|Exec=tokenicode %U|' \
            "${pkgdir}/usr/share/applications/tokenicode.desktop"
    else
        install -d "${pkgdir}/usr/share/applications"
        cat > "${pkgdir}/usr/share/applications/tokenicode.desktop" << EOF
[Desktop Entry]
Name=TOKENICODE
Comment=A beautiful desktop client for Claude Code
Exec=tokenicode %U
Icon=tokenicode
Type=Application
Categories=Development;
MimeType=x-scheme-handler/tokenicode;
StartupWMClass=tokenicode
EOF
        chmod 644 "${pkgdir}/usr/share/applications/tokenicode.desktop"
    fi

    # Install icons
    for size in 16 32 48 64 128 256 512; do
        for icon in "${_appdir}/usr/share/icons/hicolor/${size}x${size}/apps/"*; do
            if [ -f "${icon}" ]; then
                install -Dm644 "${icon}" \
                    "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tokenicode.png"
                break
            fi
        done
    done

    # Fallback icon
    if [ ! -f "${pkgdir}/usr/share/icons/hicolor/256x256/apps/tokenicode.png" ]; then
        for icon in "${_appdir}"/*.png "${_appdir}/usr/share/icons/"*; do
            if [ -f "${icon}" ]; then
                install -Dm644 "${icon}" \
                    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/tokenicode.png"
                break
            fi
        done
    fi
}
