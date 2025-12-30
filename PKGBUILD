# Maintainer: VinoFFR <vin@example.com>
pkgname=98kalculator-git
pkgver=1.0.0.r1.gf696e30
pkgrel=1
pkgdesc="The God Tier Calculator for Linux (Wayland/Qt6)"
arch=('x86_64')
url="https://github.com/VinoFFR/98kalculator"
license=('MIT')
depends=('python' 'python-pyqt6')
makedepends=('git' 'python-pyinstaller')
provides=('98kalculator')
conflicts=('98kalculator')
source=("git+https://github.com/VinoFFR/98kalculator.git")
md5sums=('SKIP')

pkgver() {
    cd "98kalculator"
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "98kalculator"
    # Create the binary
    pyinstaller --onefile --windowed --name 98kalculator src/main.py
}

package() {
    cd "98kalculator"
    
    # Install binary
    install -Dm755 "dist/98kalculator" "$pkgdir/usr/bin/98kalculator"
    
    # Install desktop entry
    # We need to ensure the Exec path is correct for system install or let the desktop file handle it
    # The desktop file in usage usually has Exec=/path/to/binary or just binary name.
    # Our generated one has absolute paths which might be wrong for package.
    # We will create a clean desktop file here or patch it.
    
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/pixmaps"
    
    # Install icon
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/98kalculator.png"
    
    # Create system compliant desktop file
    cat > "$pkgdir/usr/share/applications/98kalculator.desktop" <<EOF
[Desktop Entry]
Name=98kalculator
Comment=The God Tier Calculator
Exec=98kalculator
Icon=98kalculator
Terminal=false
Type=Application
Categories=Utility;Calculator;Science;
EOF

    # Install License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
