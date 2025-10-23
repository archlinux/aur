# Maintainer: Zeus-Deus
pkgname=gazelle-tui
pkgver=1.7.1
pkgrel=1
pkgdesc="Minimal NetworkManager TUI with complete 802.1X enterprise WiFi support"
arch=('any')
url="https://github.com/Zeus-Deus/gazelle-tui"
license=('MIT')
depends=('python' 'python-textual' 'networkmanager' 'networkmanager-openvpn' 'wireguard-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zeus-Deus/gazelle-tui/archive/v$pkgver.tar.gz")
sha256sums=('c607827502bad1e4ba8459ea9ee982521394eb089939e63f6e95fb5183c74efe')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Create gazelle package directory
    install -d "$pkgdir/usr/share/gazelle-tui"
    
    # Install Python modules
    install -Dm644 network.py "$pkgdir/usr/share/gazelle-tui/network.py"
    install -Dm644 app.py "$pkgdir/usr/share/gazelle-tui/app.py"
    
    # Install wrapper script - FORCE system Python, not conda
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/gazelle" <<'EOF'
#!/usr/bin/bash
# Force system Python (not conda)
exec /usr/bin/python3 -c "
import sys
sys.path.insert(0, '/usr/share/gazelle-tui')
from app import Gazelle
app = Gazelle()
app.run()
"
EOF
    
    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install license if exists
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
