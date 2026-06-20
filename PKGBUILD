# Maintainer: Da Chen <dachen@connect.hku.hk>
pkgname=wayper
pkgver=1.6.8
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
sha256sums=('dfdea68a50e98707ff2ae2da50b65f247489e586e5cb81d8112ad2d033793451')

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
