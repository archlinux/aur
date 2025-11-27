# Maintainer: Zeus-Deus
pkgname=gazelle-tui
pkgver=1.8.2
pkgrel=1
pkgdesc="Minimal NetworkManager TUI with complete 802.1X enterprise WiFi and WWAN support"
arch=('any')
url="https://github.com/Zeus-Deus/gazelle-tui"
license=('MIT')
depends=('python' 'python-textual' 'python-dbus' 'networkmanager' 'networkmanager-openvpn' 'wireguard-tools')
optdepends=(
    'python-tomli: Omarchy theme detection for Python < 3.11'
    'modemmanager: WWAN/cellular modem support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zeus-Deus/gazelle-tui/archive/v$pkgver.tar.gz")
sha256sums=('61bd1700d7096a2aa63ebe0de48e906b08e1b681a18dbbb1a46694a344f96b87')

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
