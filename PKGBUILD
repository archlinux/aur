# Maintainer: Your Name <youremail@domain.com>
pkgname=brushshe-git
pkgver=r442.80893e0
pkgrel=1
pkgdesc="Simple and user-friendly raster graphics editor with add-on support"
arch=('any')
url="https://github.com/limafresh/Brushshe"
license=('MPL-2.0')
depends=('python' 'python-pillow' 'python-customtkinter')
makedepends=('git')
optdepends=(
    'xclip: clipboard support on X11'
    'wl-clipboard: clipboard support on Wayland'
)
provides=('brushshe')
conflicts=('brushshe')
source=("${pkgname}::git+https://github.com/limafresh/Brushshe.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname}"
    
    # Install application files
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r Brushshe/* "$pkgdir/usr/share/$pkgname/"
    
    # Install executable wrapper
    mkdir -p "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/brushshe" << 'EOF'
#!/bin/sh
exec python /usr/share/brushshe-git/main.py "$@"
EOF
    chmod +x "$pkgdir/usr/bin/brushshe"
    
    # Install desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/brushshe.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Brushshe
Comment=Simple raster graphics editor
Exec=brushshe
Icon=brushshe
Categories=Graphics;2DGraphics;RasterGraphics;
Terminal=false
EOF
    
    # Install icon
    mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    cp Brushshe/assets/icons/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/brushshe.svg"
    
    # Install documentation
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    cp README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
