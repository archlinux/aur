pkgname=smartswap
pkgver=r1.0.0
pkgrel=1
pkgdesc="Dynamic global swappiness auto-adjuster for Arch servers with flexible system configuration"
arch=('x86_64')
url="https://github.com/Kernel-Dirichlet/smartswap"
license=('MIT')
depends=('python')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "$url/raw/main/smartswap_daemon.sh"
        "$url/raw/main/setup.sh"
        "$url/raw/main/README.md")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    # Create directories
    install -dm755 "$pkgdir/usr/lib/smartswap"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/etc/systemd/system"

    # Install the daemon script to /usr/lib/smartswap/
    install -Dm755 "$srcdir/smartswap_daemon.sh" "$pkgdir/usr/lib/smartswap/smartswap_daemon.sh"

    # Install the setup script to /usr/bin/
    install -Dm755 "$srcdir/setup.sh" "$pkgdir/usr/bin/smartswap-setup"

    # Install systemd service file via setup script (modified to write inside $pkgdir)
    bash "$srcdir/setup.sh" "$pkgdir"

    # Install documentation
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    echo "✅ Installation complete."
    echo "ℹ️  To set up smartswap, run: sudo smartswap-setup"
    echo "ℹ️  Once set up, enable and start the service with:"
    echo "    sudo systemctl enable --now smartswap-daemon"
}

