# Maintainer: Ron B <ronb1964@gmail.com>
pkgname=talktype-appimage
pkgver=0.7.4
pkgrel=1
pkgdesc="Voice dictation for Linux Wayland - press F8 to talk, powered by Whisper AI"
arch=('x86_64')
url="https://github.com/ronb1964/TalkType"
license=('MIT')
# libayatana-appindicator provides libayatana-appindicator3.so.1, which the
# bundled AyatanaAppIndicator3 typelib loads at runtime. The AppImage does NOT
# bundle this .so, so without the dependency the tray crashes on launch on a
# clean Arch install (the same failure the .deb/.rpm dependency prevents).
depends=('fuse2' 'ydotool' 'wl-clipboard' 'libayatana-appindicator')
optdepends=(
    'pipewire-pulse: PipeWire audio support'
    'pulseaudio: PulseAudio support'
)
provides=('talktype')
conflicts=('talktype')
options=('!strip')
source=("TalkType-v${pkgver}-x86_64.AppImage::https://github.com/ronb1964/TalkType/releases/download/v${pkgver}/TalkType-v${pkgver}-x86_64.AppImage"
        "talktype.desktop")
sha256sums=('70315d5a3cc820dd4a281fd099f44c5f5535bc58a624323043e06f2dba4d4ff2'
            'SKIP')
noextract=("TalkType-v${pkgver}-x86_64.AppImage")

package() {
    # Install AppImage
    install -Dm755 "TalkType-v${pkgver}-x86_64.AppImage" "${pkgdir}/opt/talktype/TalkType.AppImage"

    # Create wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/talktype" << 'EOF'
#!/bin/bash
exec /opt/talktype/TalkType.AppImage "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/talktype"

    # Install desktop file
    install -Dm644 talktype.desktop "${pkgdir}/usr/share/applications/talktype.desktop"

    # Extract and install icon from AppImage.
    #
    # The icon inside the AppImage is io.github.ronb1964.TalkType.png. It used
    # to be talktype.png, and this step hardcoded that old name behind
    # `2>/dev/null || true`, so after the rename it failed silently and the
    # package shipped with no icon at all for several releases. Glob for any
    # top-level PNG so a future rename cannot repeat that, and fail loudly if
    # none is found rather than quietly producing a package without an icon.
    cd "${srcdir}"
    chmod +x "TalkType-v${pkgver}-x86_64.AppImage"
    ./"TalkType-v${pkgver}-x86_64.AppImage" --appimage-extract 'io.github.ronb1964.TalkType.png' >/dev/null 2>&1 || true
    if [[ ! -f squashfs-root/io.github.ronb1964.TalkType.png ]]; then
        # Fall back to a full extract in case the icon was renamed again.
        ./"TalkType-v${pkgver}-x86_64.AppImage" --appimage-extract >/dev/null 2>&1 || true
    fi

    _icon=$(find squashfs-root -maxdepth 1 -name '*.png' -print -quit 2>/dev/null)
    if [[ -z "${_icon}" ]]; then
        echo "ERROR: no icon found at the root of the AppImage." >&2
        echo "       Refusing to build a package with a missing icon." >&2
        return 1
    fi

    # Installed as talktype.png to match Icon=talktype in talktype.desktop.
    install -Dm644 "${_icon}" "${pkgdir}/usr/share/pixmaps/talktype.png"

    rm -rf squashfs-root
}
