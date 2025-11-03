# Maintainer: r3dg0d <r3dg0d@users.noreply.github.com>
pkgname=ollamacode
pkgver=1.0.0
pkgrel=1
pkgdesc="Autonomous agentic coding assistant powered by Ollama with native tool calling"
arch=('any')
url="https://github.com/r3dg0d/ollamacode"
license=('MIT')
depends=('python' 'python-pip' 'ollama')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    
    # Create package directory structure
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/lib/$pkgname"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    
    # Install Python files
    install -m755 main.py "$pkgdir/usr/lib/$pkgname/"
    install -m755 ollama_client.py "$pkgdir/usr/lib/$pkgname/"
    install -m755 tools.py "$pkgdir/usr/lib/$pkgname/"
    install -m755 ui.py "$pkgdir/usr/lib/$pkgname/"
    
    # Install requirements.txt
    install -m644 requirements.txt "$pkgdir/usr/lib/$pkgname/"
    
    # Create wrapper script
    cat > "$pkgdir/usr/bin/ollamacode" << 'EOF'
#!/bin/bash
# Wrapper script for OllamaCode

SCRIPT_DIR="/usr/lib/ollamacode"
VENV_DIR="$HOME/.local/share/ollamacode/venv"

# Create venv if it doesn't exist
if [ ! -d "$VENV_DIR" ]; then
    mkdir -p "$(dirname "$VENV_DIR")"
    python3 -m venv "$VENV_DIR"
    "$VENV_DIR/bin/pip" install --quiet --upgrade pip
    "$VENV_DIR/bin/pip" install --quiet -r "$SCRIPT_DIR/requirements.txt"
fi

# Run with venv Python
exec "$VENV_DIR/bin/python" "$SCRIPT_DIR/main.py" "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/ollamacode"
    
    # Install license
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
    
    # Install README
    install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/"
}
