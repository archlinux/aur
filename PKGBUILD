# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=blender-mcp-git
pkgver=r137.61fb53e
pkgrel=1
pkgdesc="Connect Blender to Claude AI via Model Context Protocol for prompt-assisted 3D modeling"
arch=('any')
url="https://github.com/ahujasid/blender-mcp"
license=('MIT')
depends=('python' 'python-pip')
makedepends=('git')
provides=('blender-mcp')
conflicts=('blender-mcp')
source=("${pkgname}::git+https://github.com/ahujasid/blender-mcp.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    # Install as a Python package
    python -m pip install --root="$pkgdir" --prefix=/usr --no-deps --ignore-installed .

    # Remove files with embedded build paths (common pip issue)
    find "$pkgdir" -name 'direct_url.json' -delete
    python -O -m compileall -q -f -d "" "$pkgdir/usr/lib/" 2>/dev/null || true
    find "$pkgdir" -name '*.pyc' -delete
    find "$pkgdir" -type d -name '__pycache__' -empty -delete

    # Install Blender addon
    install -Dm644 addon.py "$pkgdir/usr/share/blender-mcp/addon.py"

    # Install docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
