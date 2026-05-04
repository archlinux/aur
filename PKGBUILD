# Maintainer: Berke Oruc <berke3oruc@gmail.com>

pkgname="broslauncher"
pkgver="1.0.8"
pkgrel="1"
pkgdesc="Bros Launcher - Virtual Machine for Bros OS Testing"
arch=("x86_64")
url="https://github.com/berkeoruc/bros"
license=("PROPRIETARY")
depends=("python3" "tk")
source=("broslauncher-1.0.8.tar.gz")
sha256sums=("SKIP")

package() {
    cd "$srcdir"
    
    mkdir -p "$pkgdir/usr/share/broslauncher"
    
    if [ -f "launcher.py" ]; then
        install -Dm755 launcher.py "$pkgdir/usr/share/broslauncher/launcher.py"
    fi
    
    if [ -f "constants.py" ]; then
        install -Dm644 constants.py "$pkgdir/usr/share/broslauncher/constants.py"
    fi
    
    if [ -f "schematic.py" ]; then
        install -Dm644 schematic.py "$pkgdir/usr/share/broslauncher/schematic.py"
    fi
    
    if [ -f "bros-logo.png" ]; then
        install -Dm644 bros-logo.png "$pkgdir/usr/share/broslauncher/bros-logo.png"
    fi
    
    cat > "$pkgdir/usr/bin/broslauncher" << 'EOF'
#!/bin/bash
cd /usr/share/broslauncher
echo "Downloading Bros OS ISO..."
if [ ! -f bros.iso ]; then
    echo "Download from: https://github.com/berkeoruc/bros/releases"
    echo "Place bros.iso in /usr/share/broslauncher/"
fi
exec python3 launcher.py "$@"
EOF
    chmod +x "$pkgdir/usr/bin/broslauncher"
    
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/broslauncher.desktop" << 'EOF'
[Desktop Entry]
Name=Bros Launcher
Comment=Virtual Machine for Bros OS Testing
Exec=broslauncher
Icon=broslauncher
Terminal=false
Type=Application
Categories=System;Utility;
EOF
}