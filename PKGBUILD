# Maintainer: Your Name <your.email@example.com>
pkgname=squidservers-bin
pkgver=0.6.1
pkgrel=4
pkgdesc="A tool to easily self-host Minecraft servers without port forwarding"
arch=('x86_64')
url="https://squidservers.com"
license=('custom:All Rights Reserved')
depends=('hicolor-icon-theme' 'nss' 'libxss' 'gtk3' 'libnotify')
provides=('squidservers')
conflicts=('squidservers')

source=("https://cdn.squidservers.com/squidservers_${pkgver}_amd64.deb")
sha256sums=('6e13c4030befcc3363790cbb49222f43a52007cf0f526ddea6b5fd51ac511675')

package() {
    msg2 "Extracting data from .deb..."
    tar -xf data.tar.* -C "${pkgdir}/"

    msg2 "Creating executable symlink..."
    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/SquidServers/squidservers" "${pkgdir}/usr/bin/squidservers"

    msg2 "Fixing permissions..."
    chmod +x "${pkgdir}/opt/SquidServers/squidservers"

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

    msg2 "Installing icon..."
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -m644 "${pkgdir}/opt/SquidServers/resources/app.asar.unpacked/resources/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/squidservers.png"
    install -m644 "${pkgdir}/opt/SquidServers/resources/app.asar.unpacked/resources/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/squidservers.png"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    echo "Proprietary license - see squidservers.com" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    echo "Updating icon cache..."
    gtk-update-icon-cache -f -t /usr/share/icons/hicolor
}

post_upgrade() {
    post_install
}
