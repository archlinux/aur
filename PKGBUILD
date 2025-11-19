# Maintainer: Your Name <your.email@example.com>
# Contributor: Puneet Singh Lamba <puneet.lamba@gmail.com>

pkgname=lotion
pkgver=1.5.0
pkgrel=7
pkgdesc="Unofficial Notion.so desktop application for Linux"
arch=('x86_64')
url="https://github.com/puneetsl/lotion"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'alsa-lib')
makedepends=('unzip' 'imagemagick')
optdepends=('libappindicator-gtk3: for system tray support')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
options=('!strip')

source=("https://github.com/puneetsl/lotion/releases/download/v${pkgver}/Lotion-linux-x64-${pkgver}.zip"
        "https://raw.githubusercontent.com/puneetsl/lotion/master/icon.png")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    # Clean and create extraction directory
    rm -rf "${srcdir}/lotion-app"
    mkdir -p "${srcdir}/lotion-app"
    
    # Use -o flag to overwrite files without prompting
    unzip -o -q "${srcdir}/Lotion-linux-x64-${pkgver}.zip" -d "${srcdir}/"
    
    # Move contents from subdirectory to lotion-app
    cp -r "${srcdir}/Lotion-linux-x64"/* "${srcdir}/lotion-app/"
    rm -rf "${srcdir}/Lotion-linux-x64"
}

package() {
    cd "${srcdir}/lotion-app"
    
    # Install the application directory
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -a . "${pkgdir}/opt/${pkgname}/"
    
    # Make the main executable actually executable
    chmod +x "${pkgdir}/opt/${pkgname}/lotion"
    
    # Create wrapper script in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/bash
cd /opt/${pkgname}
exec ./lotion "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
    
    # Install desktop file
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=Lotion
Comment=Unofficial Notion.so app for Linux
Exec=${pkgname} %U
Icon=${pkgname}
Type=Application
Categories=Office;TextEditor;
MimeType=x-scheme-handler/notion;
StartupWMClass=Lotion
Icon=lotion
StartupNotify=true
Keywords=notion;notes;productivity;workspace;
X-GNOME-UsesNotifications=true
EOF
    
    # Install icon (downloaded from upstream repository)
    # Create multiple formats for maximum compatibility with Dash to Dock
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    magick "${srcdir}/icon.png" -resize "48x48" -quality 100 "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    
    # Also install at common alternative locations for Dash to Dock compatibility
    install -dm755 "${pkgdir}/usr/share/app-info/icons/hicolor/48x48"
    magick "${srcdir}/icon.png" -resize "48x48" -quality 100 "${pkgdir}/usr/share/app-info/icons/hicolor/48x48/${pkgname}.png"
    
    # Install hicolor icon (resize the main icon for different sizes using imagemagick)
    # Include extra sizes commonly used by GNOME and other desktop environments
    for size in 16 20 22 24 28 32 36 40 48 64 72 96 128 192 256 512; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        magick "${srcdir}/icon.png" -resize "${size}x${size}" -quality 100 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
    
    # Skip SVG creation as it causes black/white issues in Dash to Dock
    # PNG icons work better for this application
    # Note: 512x512 is already included in the loop above
    
    # Create install script to refresh icon cache (helps with GNOME icon recognition)
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cat > "${pkgdir}/usr/share/${pkgname}/refresh-icons.sh" << 'EOF'
#!/bin/bash
# Refresh icon cache after installation
echo "Refreshing icon cache for better desktop integration..."
if command -v gtk-update-icon-cache >/dev/null 2>&1; then
    gtk-update-icon-cache -f -t /usr/share/icons/hicolor
fi
if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database /usr/share/applications
fi
echo "Icon cache refreshed. For Dash to Dock extension:"
echo "1. Restart GNOME Shell (Alt+F2, type 'r', Enter)"
echo "2. Or disable/enable Dash to Dock extension"
echo "Note: Removed SVG icons to fix black/white appearance"
EOF
    chmod +x "${pkgdir}/usr/share/${pkgname}/refresh-icons.sh"
}