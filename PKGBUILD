pkgname=smartswap
pkgver=1.0.0
pkgrel=1
pkgdesc="Dynamic global swappiness auto-adjuster for Arch servers with flexible system configuration"
arch=('x86_64')
url="https://github.com/Kernel-Dirichlet/smartswap"
license=('MIT')
depends=('python')
makedepends=('git')
source=("git+$url.git"
        "$url/raw/main/swap_manager/smartswap_daemon.sh"
        "$url/raw/main/swap_manager/setup.sh"
        "$url/raw/main/README.md"
	"$url/raw/main/LICENSE.txt")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    # Create directories
    install -dm755 "$pkgdir/usr/lib/smartswap"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/etc/systemd/system"

    # Install the daemon script to /usr/lib/smartswap/
    install -Dm755 "$srcdir/smartswap_daemon.sh" "$pkgdir/usr/lib/smartswap/smartswap_daemon.sh"

    # Install the setup script to /usr/bin/
    install -Dm755 "$srcdir/setup.sh" "$pkgdir/usr/bin/smartswap-setup"
    
    # Create and install systemd service file based on smartswap_setup.sh
    cat > "$srcdir/smartswap.service" << EOF
[Unit]
Description=Dynamic Swap Management Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash /usr/lib/smartswap/smartswap_daemon.sh
Restart=on-failure
RestartSec=5
User=root

[Install]
WantedBy=multi-user.target
EOF
    
    # Install the service file
    install -Dm644 "$srcdir/smartswap.service" "$pkgdir/etc/systemd/system/smartswap-daemon.service"

    # Install files from the git repo
    cd "$srcdir/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

post_install() {
    echo "✅ Installation complete."
    echo "ℹ️  To set up smartswap, run: sudo smartswap-setup"
    echo "ℹ️  Once set up, enable and start the service with:"
    echo "    sudo systemctl enable --now smartswap-daemon"
}

