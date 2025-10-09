# Maintainer: Guillaume Lefranc <guillaume@signal18.io>
pkgname=firezone-client-gui-bin
pkgver=1.5.7
pkgrel=1
pkgdesc="Firezone GUI client for Linux - WireGuard-based VPN client"
arch=('x86_64')
url="https://github.com/firezone/firezone"
license=('Apache')
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator')
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
sha256sums=('f7d2fd75ea7ccdb5a4fe1831465af8ca954d818091ca0a9d637cef25cb542ef5')
