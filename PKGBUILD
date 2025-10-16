# Maintainer: Zeus-Deus
pkgname=gazelle-tui
pkgver=0.1.0
pkgrel=3
pkgdesc="Minimal NetworkManager TUI with complete 802.1X enterprise WiFi support"
arch=('any')
url="https://github.com/Zeus-Deus/gazelle-tui"
license=('MIT')
depends=('python' 'python-textual' 'networkmanager')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zeus-Deus/gazelle-tui/archive/v0.1.0.tar.gz")
sha256sums=('b89d47c3289c2ff78b078f0d6c688ed4795bd0a4b19de864dea700757d27862e')

package() {
    cd "$srcdir/$pkgname-0.1.0"
    
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
