# Maintainer: VinoFFR <vin@example.com>
pkgname=98kalculator-git
pkgver=1.0.0.r1
pkgrel=1
pkgdesc="A modern calculator for Linux with Wayland/Qt6 support"
arch=('x86_64')
url="https://github.com/VinoFFR/98kalculator"
license=('MIT')
depends=('python' 'python-pyqt6')
makedepends=('git' 'python-pyinstaller')
provides=('98kalculator')
conflicts=('98kalculator')
source=("git+https://github.com/VinoFFR/98kalculator.git")
md5sums=('SKIP')

# Git version function
pkgver() {
    cd "$srcdir/98kalculator"
    if git describe --tags --long >/dev/null 2>&1; then
        git describe --tags --long | sed 's/^v//;s/-/./g'
    else
        # Fallback if no tags exist
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "$srcdir/98kalculator"
    pyinstaller --onefile --windowed --name 98kalculator src/main.py
}

package() {
    cd "$srcdir/98kalculator"
    
    # Install binary
    install -Dm755 "dist/98kalculator" "$pkgdir/usr/bin/98kalculator"
    
    # Install desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/pixmaps"
    
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/98kalculator.png"
    
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

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
