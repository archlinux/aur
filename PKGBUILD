# Maintainer: Ondrej Polak <ondrej.polak@cloudylake.io>
pkgname=nook-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Calm collaboration for teams and communities — self-hosted messaging, voice, and meetings"
arch=('x86_64')
url="https://nook.cloudylake.io"
license=('proprietary')
depends=('fuse2' 'libayatana-appindicator' 'webkit2gtk-4.1')
optdepends=('libpulse: PulseAudio audio support'
            'alsa-lib: ALSA audio support')
provides=('nook')
conflicts=('nook')
source=("nook-${pkgver}.AppImage::https://nook.cloudylake.io/download/nook-${pkgver}-linux.AppImage")
sha256sums=('SKIP')

package() {
    install -Dm755 "nook-${pkgver}.AppImage" "${pkgdir}/opt/nook/nook.AppImage"

    # Wrapper script so `nook` works from terminal
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/nook" <<'EOF'
#!/bin/sh
exec /opt/nook/nook.AppImage "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/nook"

    # .desktop entry
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/nook.desktop" <<'EOF'
[Desktop Entry]
Name=Nook
Comment=Calm collaboration for teams and communities
Exec=/opt/nook/nook.AppImage
Icon=nook
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
StartupWMClass=com.nook.desktop
X-GNOME-WMClass=com.nook.desktop
EOF

    # Icons (extracted from AppImage)
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    # Extract icons from AppImage if available
    chmod +x "nook-${pkgver}.AppImage"
    if ./"nook-${pkgver}.AppImage" --appimage-extract usr/share/icons &>/dev/null; then
        find squashfs-root/usr/share/icons -name "*.png" | while read -r icon; do
            rel="${icon#squashfs-root/}"
            install -Dm644 "$icon" "${pkgdir}/${rel}"
        done
        rm -rf squashfs-root
    fi
}
