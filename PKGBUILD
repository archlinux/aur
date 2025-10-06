# Maintainer: Fergal Moran <aur@ferg.al>
pkgname=xtreamium-proxy
pkgver=1.3.0
pkgrel=1
pkgdesc="Xtreamium Proxy Service - IPTV/Streaming Proxy Server"
arch=('x86_64')
url="https://github.com/xtreamium/xtreamium-proxy"
license=('custom')
depends=('glibc' 'gcc-libs' 'zlib' 'openssl')
optdepends=('sqlite: Database backend')
provides=('xtreamium-proxy')
conflicts=('xtreamium-proxy')
options=('!debug' '!strip')
backup=('opt/xtreamium-proxy/appsettings.json')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xtreamium/xtreamium-proxy/releases/download/v${pkgver}/xtreamium-proxy-linux.tar.gz")
sha256sums=('2ae4212e3c93b71678bf794c0aaeafd4d10bdc1249d5221fa6fb0dcf03277b44')

package() {
    cd "$srcdir"

    # Create installation directory
    install -dm755 "$pkgdir/opt/xtreamium-proxy"
    
    # Copy all files from the published output
    cp -r * "$pkgdir/opt/xtreamium-proxy/"
    
    # Ensure the main executable has proper permissions
    chmod 755 "$pkgdir/opt/xtreamium-proxy/xtreamium-proxy"
    
    # Install user systemd service file if present
    if [ -f "xtreamium-proxy-user.service" ]; then
        install -Dm644 xtreamium-proxy-user.service "$pkgdir/usr/lib/systemd/user/xtreamium-proxy.service"
    fi
    
    # Install documentation if present
    if [ -f "README.md" ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
    fi
    
    # Remove installer scripts from the installation directory
    rm -f "$pkgdir/opt/xtreamium-proxy/install.sh"
    rm -f "$pkgdir/opt/xtreamium-proxy/uninstall.sh"
    rm -f "$pkgdir/opt/xtreamium-proxy/xtreamium-proxy.service"
    rm -f "$pkgdir/opt/xtreamium-proxy/xtreamium-proxy-user.service"
}

post_install() {
    echo ""
    echo "==> Xtreamium Proxy has been installed!"
    echo ""
    echo "Setting permissions..."
    chown -R $USER:$USER /opt/xtreamium-proxy
    
    echo ""
    echo "To start the service:"
    echo "  systemctl --user enable --now xtreamium-proxy"
    echo ""
    echo "Configuration file: /opt/xtreamium-proxy/appsettings.json"
    echo ""
    echo "View logs:"
    echo "  journalctl --user -u xtreamium-proxy -f"
    echo ""
}

post_upgrade() {
    echo ""
    echo "==> Upgrading xtreamium-proxy..."
    
    # Check if service is running
    if systemctl --user is-active --quiet xtreamium-proxy 2>/dev/null; then
        echo "Stopping service..."
        systemctl --user stop xtreamium-proxy
        SERVICE_WAS_RUNNING=1
    fi
    
    echo "Setting permissions..."
    chown -R $USER:$USER /opt/xtreamium-proxy
    
    echo "Reloading systemd daemon..."
    systemctl --user daemon-reload
    
    # Restart service if it was running
    if [ -n "$SERVICE_WAS_RUNNING" ]; then
        echo "Restarting service..."
        systemctl --user start xtreamium-proxy
    fi
    
    echo ""
    echo "==> Xtreamium Proxy has been upgraded!"
    echo ""
    if [ -z "$SERVICE_WAS_RUNNING" ]; then
        echo "If you want to start the service, run:"
        echo "  systemctl --user restart xtreamium-proxy"
        echo ""
    fi
}

pre_remove() {
    echo "Stopping and disabling service..."
    
    if systemctl --user is-active --quiet xtreamium-proxy 2>/dev/null; then
        systemctl --user stop xtreamium-proxy
    fi
    
    if systemctl --user is-enabled --quiet xtreamium-proxy 2>/dev/null; then
        systemctl --user disable xtreamium-proxy
    fi
}

post_remove() {
    systemctl --user daemon-reload 2>/dev/null || true
    
    echo ""
    echo "==> Xtreamium Proxy has been removed."
    echo ""
    echo "Data and logs remain in:"
    echo "  /opt/xtreamium-proxy/Data"
    echo "  /opt/xtreamium-proxy/logs"
    echo ""
    echo "Remove these manually if desired."
    echo ""
}
