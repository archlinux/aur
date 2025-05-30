# Maintainer: Your Name <your.email@example.com>
# Contributor: Puneet Singh Lamba <puneet.lamba@gmail.com>

pkgname=lotion
pkgver=1.0.0
pkgrel=5
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

# v1.0.0 provides unified Linux build - no more separate variants
source=("https://github.com/puneetsl/lotion/releases/download/v1.0.0/Lotion-linux-x64-1.0.0.zip"
        "https://raw.githubusercontent.com/puneetsl/lotion/master/icon.png")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    # Clean and create extraction directory
    rm -rf "${srcdir}/lotion-app"
    mkdir -p "${srcdir}/lotion-app"
    
    # Extract the archive (v1.0.0 uses zip format)
    # Use -o flag to overwrite files without prompting
    unzip -o -q "${srcdir}/Lotion-linux-x64-1.0.0.zip" -d "${srcdir}/"
    
    # Move contents from subdirectory to lotion-app
    cp -r "${srcdir}/Lotion-linux-x64"/* "${srcdir}/lotion-app/"
    rm -rf "${srcdir}/Lotion-linux-x64"
}

package() {
    cd "${srcdir}/lotion-app"
    
    # Install the application directory
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -a . "${pkgdir}/opt/${pkgname}/"
    
    # Make the main executable actually executable (v1.0.0 uses lowercase 'lotion')
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
Comment=Unofficial Notion.so app for Linux (v1.0.0)
Exec=${pkgname} %U
Icon=${pkgname}
Type=Application
Categories=Office;TextEditor;
MimeType=x-scheme-handler/notion;
StartupWMClass=Lotion
Icon=lotion
StartupNotify=true
Keywords=notion;notes;productivity;workspace;
EOF
    
    # Install icon (downloaded from upstream repository)
    # Create a 48x48 version for pixmaps (GNOME application menu)
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    magick "${srcdir}/icon.png" -resize "48x48" -quality 100 "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    
    # Install hicolor icon (resize the main icon for different sizes using imagemagick)
    # Include extra sizes commonly used by GNOME and other desktop environments
    for size in 16 20 22 24 28 32 36 40 48 64 72 96 128 192 256 512; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        magick "${srcdir}/icon.png" -resize "${size}x${size}" -quality 100 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
    
    # Create SVG version for true scalability (GNOME prefers SVG)
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    magick "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    
    # Create symbolic icon for GNOME dock (fixes black/white appearance)
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
    # Create proper symbolic SVG (monochrome notes icon for dock integration)
    cat > "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/${pkgname}-symbolic.svg" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
  <!-- Document/notes icon representing Notion/Lotion -->
  <path d="M3 1v14h8l2-2V1H3zm1 1h8v10h-2v2H4V2z" fill="currentColor"/>
  <path d="M5 4h5v1H5V4z" fill="currentColor"/>
  <path d="M5 6h5v1H5V6z" fill="currentColor"/>
  <path d="M5 8h3v1H5V8z" fill="currentColor"/>
</svg>
EOF
    
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
echo "Icon cache refreshed. You may need to restart your desktop session to see the icon."
EOF
    chmod +x "${pkgdir}/usr/share/${pkgname}/refresh-icons.sh"
}