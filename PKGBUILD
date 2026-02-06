# Maintainer: Max Marze <max@marze.dev>
pkgname=creature-desktop-bin
pkgver=0.0.28
pkgrel=1
pkgdesc="The Graphical Agent Interface - Build and share MCP Apps for humans and agents working together"
arch=('x86_64')
url="https://creature.run"
license=('custom')
depends=(
    'gtk3'
    'nss'
    'alsa-lib'
    'libxss'
    'libxtst'
    'xdg-utils'
    'libsecret'
    'libayatana-appindicator'
)
optdepends=(
    'libnotify: for desktop notifications'
)
provides=('creature-desktop')
conflicts=('creature-desktop')
install=${pkgname}.install
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::https://releases.creature.run/desktop/linux/x64/Creature-${pkgver}-x64.AppImage")
sha256sums=('d7096f8b642fd9dcd8bd791325b1b9ecaf44d637573bb424b8cfe54442fdf7a6')
noextract=("${pkgname}-${pkgver}.AppImage")

makedepends=('imagemagick')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract

    # Generate smaller icon sizes from the 1024x1024 source
    local _src="${srcdir}/squashfs-root/usr/share/icons/hicolor/1024x1024/apps/creature-desktop-app.png"
    for _size in 16 24 32 48 64 128 256 512; do
        mkdir -p "${srcdir}/icons/${_size}x${_size}"
        magick "${_src}" -resize "${_size}x${_size}" "${srcdir}/icons/${_size}x${_size}/creature-desktop-app.png"
    done
}

package() {
    # Install the main application
    install -dm755 "${pkgdir}/opt/creature-desktop"
    cp -r "${srcdir}/squashfs-root/usr/lib/creature-desktop-app/"* "${pkgdir}/opt/creature-desktop/"

    # Install icons at multiple sizes
    for _size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "${srcdir}/icons/${_size}x${_size}/creature-desktop-app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/creature-desktop-app.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/1024x1024/apps/creature-desktop-app.png" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/creature-desktop-app.png"

    # Install the desktop file (patched)
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/creature-desktop.desktop" <<EOF
[Desktop Entry]
Version=1.5
Type=Application
Name=Creature
Comment=The Graphical Agent Interface
Exec=/opt/creature-desktop/Creature %U
Icon=creature-desktop-app
Categories=Development;Utility;
StartupWMClass=Creature
EOF

    # Install the license
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/creature-desktop-app/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Create symlink for the binary
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/creature-desktop/Creature "${pkgdir}/usr/bin/creature"

    # Fix permissions for chrome-sandbox
    chmod 4755 "${pkgdir}/opt/creature-desktop/chrome-sandbox"
}
