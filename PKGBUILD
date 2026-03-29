# Maintainer: Da Chen <dachen@connect.hku.hk>
pkgname=wayper
pkgver=0.13.0
pkgrel=1
pkgdesc="Wayland-first wallpaper manager with Wallhaven integration and MCP server"
arch=('any')
url="https://github.com/yuukidach/wayper"
license=('MIT')
depends=('python' 'python-click' 'python-httpx' 'python-pillow' 'awww'
         'python-fastapi' 'uvicorn' 'python-multipart' 'python-send2trash')
makedepends=('python-build' 'python-installer' 'python-hatchling')
optdepends=(
    'hyprland: focused monitor detection'
    'python-mcp: MCP server for AI assistant integration'
    'electron: Electron GUI app (wayper-gui)'
    'npm: install Electron dependencies'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/yuukidach/wayper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ed04e97a61acb252f0fd0b7d8b9c04d4c3a39a4d6071561dcaace4d58c5fc98d')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Desktop entry for GUI
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/wayper.desktop" <<EOF
[Desktop Entry]
Name=Wayper
Exec=wayper-gui
Icon=preferences-desktop-wallpaper
Type=Application
Categories=Utility;
Comment=Wallpaper manager with Wallhaven integration
EOF
}
