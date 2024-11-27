# Maintainer: Chirag Bharambe <chirag@bharambe.dev>

pkgname=xmind2md
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to convert XMind files to Markdown format"
arch=('any')
url="https://github.com/chiragbharambe/xmind2md"
license=('MIT')
depends=('python')
makedepends=('python-pip' 'python-virtualenv')

source=("$pkgname-$pkgver.tar.gz::https://github.com/chiragbharambe/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Create necessary directories
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/share/$pkgname"

    # Install Python script
    install -Dm755 xmind_converter.py "$pkgdir/usr/lib/$pkgname/xmind_converter.py"

    # Create setup script
    cat > "$pkgdir/usr/lib/$pkgname/setup.sh" << 'EOF'
#!/bin/bash

VENV_PATH="$HOME/.local/share/xmind2md/venv"

# Create virtual environment if it doesn't exist
if [ ! -d "$VENV_PATH" ]; then
    mkdir -p "$HOME/.local/share/xmind2md"
    python -m venv "$VENV_PATH"
    source "$VENV_PATH/bin/activate"
    pip install xmindparser
    deactivate
fi

echo "Setup complete! xmind2md is ready to use."
EOF
    chmod 755 "$pkgdir/usr/lib/$pkgname/setup.sh"

    # Create main executable
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash

VENV_PATH="$HOME/.local/share/xmind2md/venv"

# Check if venv exists, if not run setup
if [ ! -d "$VENV_PATH" ]; then
    /usr/lib/xmind2md/setup.sh
fi

# Activate venv and run converter
source "$VENV_PATH/bin/activate"
python /usr/lib/xmind2md/xmind_converter.py "$@"
deactivate
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Install license and readme
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
