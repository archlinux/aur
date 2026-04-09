# Maintainer: Your Name <your.email@example.com>
pkgname=squidservers-bin
_pkgname=squidservers
pkgver=0.6.8
pkgrel=1
pkgdesc="A tool to easily self-host Minecraft servers without port forwarding"
arch=('x86_64')
url="https://squidservers.com"
license=('custom:All Rights Reserved')
# Added alsa-lib, at-spi2-core, and libxtst for full Electron support
depends=('hicolor-icon-theme' 'nss' 'libxss' 'gtk3' 'libnotify' 'alsa-lib' 'at-spi2-core' 'libxtst')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')

source=("https://cdn.squidservers.com/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('58de5dc69d6431dd43ac8bfec69687c901305bcf16c29148f1473240aaf26790')

package() {
    msg2 "Extracting data from .deb..."
    bsdtar -xf data.tar.* -C "${pkgdir}/"

    # Clean up Debian artifacts
    rm -f "${pkgdir}/"{control,md5sums,conffiles,debian-binary} 2>/dev/null || true

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

    msg2 "Installing icons..."
    install -Dm644 "${pkgdir}/opt/SquidServers/resources/app.asar.unpacked/resources/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    msg2 "Installing License..."
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
Proprietary license - see squidservers.com
EOF
}
