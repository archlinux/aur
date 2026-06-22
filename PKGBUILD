# Maintainer: Guillaume Lefranc <guillaume@signal18.io>
pkgname=firezone-client-gui-bin
pkgver=1.5.14
pkgrel=1
pkgdesc="Firezone GUI client for Linux - WireGuard-based VPN client"
arch=('x86_64')
url="https://github.com/firezone/firezone"
license=('Apache')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
optdepends=('wireguard-tools: for WireGuard functionality')
provides=('firezone-client-gui-bin')
conflicts=('firezone-client-gui')
install=firezone-client-gui-bin.install
source=("https://github.com/firezone/firezone/releases/download/gui-client-${pkgver}/firezone-client-gui-linux_${pkgver}_x86_64.deb")

prepare() {
    cd "$srcdir"
    
    # Extract the Debian package
    ar x "firezone-client-gui-linux_${pkgver}_x86_64.deb"
    tar -xf data.tar.gz
}

package() {
    cd "$srcdir"
    
    # Install files to appropriate locations
    cp -r usr/ "$pkgdir/"
    
    # Set proper permissions
    find "$pkgdir" -type f -exec chmod 644 {} \;
    find "$pkgdir" -type d -exec chmod 755 {} \;
    
    # Make binaries executable
    find "$pkgdir/usr/bin" -type f -exec chmod 755 {} \; 2>/dev/null || true
    
    # Ensure desktop file is properly installed
    if [ -f "$pkgdir/usr/share/applications/firezone-client-gui.desktop" ]; then
        desktop-file-validate "$pkgdir/usr/share/applications/firezone-client-gui.desktop" 2>/dev/null || true
    fi
}
sha256sums=('2ed0a485f2768ffc67e5db5a2241b2b8cbc180437e2c696a683a44ba542e6992')
