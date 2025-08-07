# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=velodown-bin
pkgver=0.3.12
pkgrel=3
pkgdesc="A blazing-fast download manager built with Rust and Tauri"
arch=('x86_64')
url="https://github.com/mlm-games/velodown"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
optdepends=('libnotify: for desktop notifications')
provides=('velodown')
conflicts=('velodown')
options=('!strip' '!emptydirs')
source_x86_64=("velodown-${pkgver}.AppImage::https://github.com/mlm-games/velodown/releases/download/v${pkgver}/velodown_${pkgver}_amd64.AppImage")
sha256sums_x86_64=('1f334e5a733c4f3c1203d5163bed806716acd664823b1c4d9ffff7de0d544831')
noextract=("velodown-${pkgver}.AppImage")

package() {
    # Create desktop file
    cat > "${srcdir}/velodown.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=VeloDown
Comment=A blazing-fast download manager built with Rust and Tauri
GenericName=Download Manager
Exec=/opt/velodown/velodown.AppImage %U
Icon=velodown
Terminal=false
Type=Application
Categories=Network;FileTransfer;Qt;
MimeType=x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/magnet;
StartupNotify=true
Keywords=download;manager;accelerator;rust;tauri;
Actions=new-window;

[Desktop Action new-window]
Name=Open a New Window
Exec=/opt/velodown/velodown.AppImage --new-window
DESKTOP_EOF

    # Extract AppImage for icons
    chmod +x "${srcdir}/velodown-${pkgver}.AppImage"
    "${srcdir}/velodown-${pkgver}.AppImage" --appimage-extract > /dev/null 2>&1

    # Install AppImage
    install -Dm755 "${srcdir}/velodown-${pkgver}.AppImage" "${pkgdir}/opt/velodown/velodown.AppImage"
    
    # Create executable wrapper
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/velodown" << WRAPPER_EOF
#!/bin/bash
exec /opt/velodown/velodown.AppImage "\$@"
WRAPPER_EOF
    chmod 755 "${pkgdir}/usr/bin/velodown"
    
    # Install desktop file
    install -Dm644 "${srcdir}/velodown.desktop" "${pkgdir}/usr/share/applications/velodown.desktop"
    
    # Install icons from extracted AppImage
    if [ -d "${srcdir}/squashfs-root" ]; then
        # Try multiple possible icon locations
        for icon_path in \
            "${srcdir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/velodown.png" \
            "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/velodown.png" \
            "${srcdir}/squashfs-root/velodown.png" \
            "${srcdir}/squashfs-root/icon.png"; do
            if [ -f "$icon_path" ]; then
                install -Dm644 "$icon_path" "${pkgdir}/usr/share/pixmaps/velodown.png"
                break
            fi
        done
        
        # Install all available icon sizes
        for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
            icon_file="${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}/apps/velodown.png"
            if [ -f "$icon_file" ]; then
                install -Dm644 "$icon_file" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/velodown.png"
            fi
        done
    fi
}
