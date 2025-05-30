# Maintainer: Your Name <your.email@example.com>
# Contributor: Puneet Singh Lamba <puneet.lamba@gmail.com>

pkgname=lotion
pkgver=1.0.0
pkgrel=2
pkgdesc="Unofficial Notion.so desktop application for Linux"
arch=('x86_64')
url="https://github.com/puneetsl/lotion"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'alsa-lib')
makedepends=('unzip')
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
StartupWMClass=lotion
EOF
    
    # Install icon (downloaded from upstream repository)
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -m644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    
    # Install hicolor icon (resize the main icon for different sizes)
    for size in 16 22 24 32 48 64 128 256; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        # Note: This requires imagemagick to be available during install, or we use the same icon for all sizes
        install -m644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
    
    # Install scalable icon
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -m644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
}