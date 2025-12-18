# Maintainer: Ron B <ronb1964@gmail.com>
pkgname=talktype-appimage
pkgver=0.5.10
pkgrel=1
pkgdesc="Voice dictation for Linux Wayland - press F8 to talk, powered by Whisper AI"
arch=('x86_64')
url="https://github.com/ronb1964/TalkType"
license=('MIT')
depends=('fuse2' 'ydotool' 'wl-clipboard')
optdepends=(
    'pipewire-pulse: PipeWire audio support'
    'pulseaudio: PulseAudio support'
)
provides=('talktype')
conflicts=('talktype')
options=('!strip')
source=("TalkType-v${pkgver}-x86_64.AppImage::https://github.com/ronb1964/TalkType/releases/download/v${pkgver}/TalkType-v${pkgver}-x86_64.AppImage"
        "talktype.desktop")
sha256sums=('33a07dd0868e8bd1342d376a04f0ef9254a222e5709b4bcc768b5c82332ca616'
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

    # Extract and install icon from AppImage
    cd "${srcdir}"
    chmod +x "TalkType-v${pkgver}-x86_64.AppImage"
    ./"TalkType-v${pkgver}-x86_64.AppImage" --appimage-extract talktype.png 2>/dev/null || true
    if [[ -f squashfs-root/talktype.png ]]; then
        install -Dm644 squashfs-root/talktype.png "${pkgdir}/usr/share/pixmaps/talktype.png"
    fi
    rm -rf squashfs-root
}
