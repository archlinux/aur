# Maintainer: CriticalRange

pkgname=coresound-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Desktop Bluetooth audio controller for Soundcore/Anker devices"
arch=('x86_64')
url="https://github.com/CriticalRange/CoreSound"
license=('GPL-3.0-only')
depends=('fuse2' 'bluez')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/CriticalRange/CoreSound/releases/download/v${pkgver}/CoreSound-${pkgver}.AppImage")
sha256sums=('SKIP')

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract usr/share/icons 2>/dev/null || true
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract *.png 2>/dev/null || true
}

package() {
    install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/coresound/coresound.AppImage"

    # Launcher symlink
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/coresound/coresound.AppImage "${pkgdir}/usr/bin/coresound"

    # Icons extracted from AppImage
    if [ -d squashfs-root/usr/share/icons ]; then
        cp -r squashfs-root/usr/share/icons "${pkgdir}/usr/share/"
    fi
    # Fallback: install root PNG as hicolor icon
    local icon
    icon=$(find squashfs-root -maxdepth 1 -name "*.png" | head -1)
    if [ -n "$icon" ]; then
        install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/coresound.png"
    fi

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/coresound.desktop" <<EOF
[Desktop Entry]
Name=CoreSound
Comment=Desktop Bluetooth audio controller for Soundcore/Anker devices
Exec=/opt/coresound/coresound.AppImage
Icon=coresound
Terminal=false
Type=Application
Categories=AudioVideo;Audio;
EOF
}
