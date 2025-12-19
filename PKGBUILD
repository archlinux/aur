# Maintainer: AILinux Repository <admin@ailinux.me>
pkgname=ailinux-client
pkgver=4.2.0
pkgrel=1
pkgdesc="AILinux Client - Multi-LLM AI Assistant with MCP Integration"
arch=('x86_64')
url="https://ailinux.me"
license=('MIT')
depends=(
    'python>=3.10'
    'python-pyqt6'
    'python-pyqt6-webengine'
    'python-httpx'
    'python-cryptography'
    'python-keyring'
    'qt6-webengine'
    'qt6-base'
    'tor'
)
optdepends=(
    'python-pystemmer: Enhanced search capabilities'
    'ollama: Local AI model support'
)
source=("https://repo.ailinux.me/mirror/archive.ailinux.me/pool/main/a/ailinux-client/ailinux-client_${pkgver}.orig.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/ailinux-client-${pkgver}"
    
    # Python-Paket installieren
    python -m installer --destdir="$pkgdir" dist/*.whl 2>/dev/null || \
    pip install --root="$pkgdir" --no-deps --ignore-installed . 2>/dev/null || \
    python setup.py install --root="$pkgdir" --optimize=1
    
    # Desktop-Datei
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ailinux-client.desktop" << DESKTOP
[Desktop Entry]
Name=AILinux Client
Comment=Multi-LLM AI Assistant
Exec=ailinux-client
Icon=ailinux-client
Type=Application
Categories=Utility;Development;
Keywords=AI;LLM;Assistant;Claude;GPT;
DESKTOP

    # Icon (falls vorhanden)
    if [ -f "assets/icon.png" ]; then
        install -Dm644 assets/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/ailinux-client.png"
    fi
    
    # Lizenz
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
