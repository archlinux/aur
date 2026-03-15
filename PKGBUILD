# Maintainer: Your Name <your.email@example.com>
pkgname=squidservers-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A tool to easily self-host Minecraft servers without port forwarding"
arch=('x86_64')
url="https://squidservers.com"
license=('custom:All Rights Reserved')
depends=('hicolor-icon-theme' 'nss' 'libxss' 'gtk3' 'libnotify') # Common Electron dependencies
provides=('squidservers')
conflicts=('squidservers')

# Using ${pkgver} here makes it easy to update later
source=("https://cdn.squidservers.com/squidservers_${pkgver}_amd64.deb")
sha256sums=('SKIP') # Use 'SKIP' for testing; ideally replace with actual hash later

package() {
    # 1. Extract the Debian data archive
    # Most modern .debs use data.tar.xz or data.tar.zst
    msg2 "Extracting data from .deb..."
    tar -xf data.tar.* -C "${pkgdir}/"

    # 2. Create a symlink in /usr/bin/ so you can launch it via terminal
    # This points to the location we found earlier in /opt/
    msg2 "Creating executable symlink..."
    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/SquidServers/squidservers" "${pkgdir}/usr/bin/squidservers"

    # 3. Fix permissions for the main executable
    chmod +x "${pkgdir}/opt/SquidServers/squidservers"

    # 4. Generate the Desktop shortcut
    # Since the .deb had the icon in /usr/share/icons, we just point to it.
    msg2 "Installing Desktop Entry..."
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/squidservers.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=SquidServers
Comment=Easy Minecraft Server Hosting
Exec=squidservers
Icon=squidservers
Terminal=false
Categories=Network;Game;
EOF

    # 5. Handle the license
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    echo "Proprietary license - see squidservers.com" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}