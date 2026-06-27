# Maintainer: ludvig2457 <ludvig2457@archlinux.org>

pkgname=superlauncher
pkgver=2.0.0
pkgrel=2
pkgdesc="Minecraft launcher with mod support and server management"
arch=('any')
url="https://github.com/Ludvig2457Ultra/SuperLauncherMC-for-linux"
license=('GPL3')
depends=('python' 'python-pyqt6' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 superlauncher.py "$pkgdir/usr/share/superlauncher/superlauncher.py"
    install -Dm644 requirements.txt "$pkgdir/usr/share/superlauncher/requirements.txt"

    mkdir -p "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/superlauncher" << 'WRAPPER'
#!/usr/bin/env bash
set -euo pipefail

DIR="/usr/share/superlauncher"
VENV="$HOME/.local/share/superlauncher/venv"
SCRIPT="$DIR/superlauncher.py"
REQ="$DIR/requirements.txt"

if [ ! -f "$VENV/bin/python3" ]; then
    echo "Creating venv and installing dependencies..."
    python3 -m venv "$VENV"
    "$VENV/bin/pip" install -r "$REQ" --quiet
fi

exec "$VENV/bin/python3" "$SCRIPT" "$@"
WRAPPER
    chmod +x "$pkgdir/usr/bin/superlauncher"

    install -Dm644 superlauncher.desktop \
        "$pkgdir/usr/share/applications/superlauncher.desktop"
    install -Dm644 assets/icon.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/superlauncher.png"

    cp -r assets "$pkgdir/usr/share/superlauncher/assets"
}
