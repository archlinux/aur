# Maintainer: Your Name <your.email@example.com>
pkgname=squidservers-bin
_pkgname=squidservers
pkgver=0.6.2
pkgrel=6
pkgdesc="A tool to easily self-host Minecraft servers without port forwarding"
arch=('x86_64')
url="https://squidservers.com"
license=('custom:All Rights Reserved')
depends=('hicolor-icon-theme' 'nss' 'libxss' 'gtk3' 'libnotify')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip') # Critical for pre-compiled Electron apps

source=("https://cdn.squidservers.com/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('bf70db4e416e03449894037c88066f68e29193aaa52aeb49d085b346b81a0560')

package() {
    msg2 "Extracting data from .deb..."
    # makepkg auto-extracts the .deb into $srcdir. We extract the resulting data tarball into $pkgdir.
    bsdtar -xf data.tar.* -C "${pkgdir}/"

    msg2 "Creating executable symlink..."
    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/SquidServers/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    msg2 "Fixing permissions..."
    chmod +x "${pkgdir}/opt/SquidServers/${_pkgname}"

    msg2 "Installing Desktop Entry..."
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=SquidServers
Comment=Easy Minecraft Server Hosting
Exec=squidservers %U
Icon=squidservers
Terminal=false
Categories=Network;Game;
MimeType=x-scheme-handler/squidservers;
EOF

    msg2 "Installing icon..."
    # 'install -D' automatically creates missing parent directories
    install -Dm644 "${pkgdir}/opt/SquidServers/resources/app.asar.unpacked/resources/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    install -Dm644 "${pkgdir}/opt/SquidServers/resources/app.asar.unpacked/resources/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    msg2 "Installing License..."
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
Proprietary license - see squidservers.com
EOF
}
