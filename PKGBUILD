# Maintainer: Chitransh <chitranshSingh4174@gmail.com>

pkgname=arch-script-gen
pkgver=1.1.1
pkgrel=1
pkgdesc="A PyQt6 GUI app that generates Arch Linux configuration bash scripts using the Groq API"
arch=('any')
url="https://github.com/ChitranshSingh-ind/ArchScriptGen"
license=('MIT')
depends=(
    'python'
    'python-pyqt6'
    'python-requests'
    'qt6-base'
)
makedepends=('python-pip')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChitranshSingh-ind/ArchScriptGen/archive/refs/tags/v1.1.1.tar.gz")
sha256sums=('f4c1a9a76848d09ec04815cd2b2a1c468be7fd256d9e8ff99aa8fc9cd9dcfb13')

package() {
    cd "$srcdir/ArchScriptGen-1.1.1"

    # Install python-groq (not in official repos)
    pip install groq --target="$pkgdir/usr/lib/$pkgname/lib" --no-deps 2>/dev/null || true
    pip install groq --target="$pkgdir/usr/lib/$pkgname/lib" 2>/dev/null || true

    # Create app directory
    install -dm755 "$pkgdir/usr/lib/$pkgname"

    # Install main script
    install -Dm755 main.py "$pkgdir/usr/lib/$pkgname/main.py"

    # Install assets
    cp -r themes             "$pkgdir/usr/lib/$pkgname/"
    cp -r cursors            "$pkgdir/usr/lib/$pkgname/"
    cp -r DesktopEnvironment "$pkgdir/usr/lib/$pkgname/"

    # Install icon
    install -Dm644 logo.ico "$pkgdir/usr/share/pixmaps/$pkgname.ico"

    # Create launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
export PYTHONPATH="/usr/lib/$pkgname/lib:\$PYTHONPATH"
cd /usr/lib/$pkgname
exec python main.py "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Arch Script Generator
Comment=Generate Arch Linux configuration scripts
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=System;Utility;
Keywords=arch;linux;bash;script;
EOF
}
