# Maintainer: Cyberlete <support@cyberlete.com>
pkgname=cyberlete-bin
pkgver=0.1.27
pkgrel=3
pkgdesc="Anti-cheat desktop client with Cyberlete Cloud node support"
arch=('x86_64')
url="https://cyberlete.net"
license=('LicenseRef-Cyberlete-Proprietary')
depends=('fuse2' 'java-runtime>=17' 'hicolor-icon-theme')
optdepends=('libappindicator-gtk3: system tray support')
provides=('cyberlete')
conflicts=('cyberlete')
options=('!strip' '!debug')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/Cyberlete/cyberlete-releases/releases/download/v${pkgver}/Cyberlete_${pkgver}_amd64.AppImage"
        "cyberlete.desktop")
sha256sums=('39a52b2fd2380ad06e90d72123c118e1ff1ef418147b556eb963f469830f12d6'
            '25f99e380f634a176c7dc938b9c7a9f67918788c8273f191ac8cd47aa0ce7ec5')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    # Extract only to harvest icons — the AppImage itself is installed whole
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install the AppImage binary (runs via FUSE at runtime)
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
        "${pkgdir}/opt/cyberlete/cyberlete.AppImage"

    # Wrapper script with NVIDIA DMABUF workaround
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/cyberlete" << 'LAUNCHER'
#!/bin/bash
# Workaround for WebKitGTK DMABUF rendering bug on NVIDIA GPUs
if lsmod | grep -q '^nvidia '; then
    export WEBKIT_DISABLE_DMABUF_RENDERER=1
fi
export DESKTOPINTEGRATION=false
exec /opt/cyberlete/cyberlete.AppImage "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/cyberlete"

    # Desktop entry
    install -Dm644 "${srcdir}/cyberlete.desktop" \
        "${pkgdir}/usr/share/applications/cyberlete.desktop"

    # Icons (harvested from squashfs extraction)
    for _size in 32x32 128x128; do
        if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_size}/apps/cyberlete-desktop-app.png" ]; then
            install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_size}/apps/cyberlete-desktop-app.png" \
                "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/cyberlete.png"
        fi
    done
    # 256x256@2 → install as standard 256x256
    if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256@2/apps/cyberlete-desktop-app.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256@2/apps/cyberlete-desktop-app.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cyberlete.png"
    fi
}
