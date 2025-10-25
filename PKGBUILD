# Maintainer: Parker Hurst <parker at example dot com>

pkgname=physica
pkgver=1.0
pkgrel=1
pkgdesc="Physical game cartridge manager for PC games - turn USB drives into plug-and-play game cartridges"
arch=('any')
url="https://github.com/parkerHurst/Physica"
license=('MIT')
depends=(
    'python>=3.11'
    'python-dbus'
    'python-gobject'
    'python-pyudev'
    'python-psutil'
    'python-toml'
    'python-dateutil'
    'gtk4'
    'libadwaita'
)
makedepends=('git')
optdepends=(
    'wine: Windows game compatibility'
    'proton: Steam Proton for better Windows game support'
)
provides=('physica')
conflicts=('physica-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('723402c61a621d8e9df9db70200f117f8b5ad90ff4767b953e52178c5420d12c')

package() {
    cd "$srcdir/Physica-$pkgver"
    
    # Create installation directory
    install -dm755 "$pkgdir/opt/physica"
    
    # Install application files
    cp -r service "$pkgdir/opt/physica/"
    cp -r gtk-app "$pkgdir/opt/physica/"
    cp -r scripts "$pkgdir/opt/physica/"
    cp run_service.sh "$pkgdir/opt/physica/"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Create virtual environment for dependencies
    python -m venv "$pkgdir/opt/physica/venv"
    
    # Install Python dependencies into venv
    "$pkgdir/opt/physica/venv/bin/pip" install --no-cache-dir \
        -r "$pkgdir/opt/physica/service/requirements.txt" \
        -r "$pkgdir/opt/physica/gtk-app/requirements.txt"
    
    # Create launcher scripts
    install -dm755 "$pkgdir/usr/bin"
    
    cat > "$pkgdir/usr/bin/physica-service" << 'EOF'
#!/bin/bash
VENV="/opt/physica/venv"
cd /opt/physica/service
exec "$VENV/bin/python" -u main.py "$@"
EOF
    
    cat > "$pkgdir/usr/bin/physica" << 'EOF'
#!/bin/bash
VENV="/opt/physica/venv"
cd /opt/physica/gtk-app
exec "$VENV/bin/python" run.py "$@"
EOF
    
    chmod +x "$pkgdir/usr/bin/physica-service"
    chmod +x "$pkgdir/usr/bin/physica"
    
    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/physica.desktop" << 'EOF'
[Desktop Entry]
Name=Physica
Comment=Physical Game Cartridge Manager
Exec=physica
Icon=applications-games
Terminal=false
Type=Application
Categories=Game;Utility;
Keywords=games;cartridge;usb;steam;
EOF
    
    # Install systemd user service (optional)
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/physica.service" << 'EOF'
[Unit]
Description=Physica Game Cartridge Service
After=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/physica-service
Restart=on-failure

[Install]
WantedBy=default.target
EOF
}

