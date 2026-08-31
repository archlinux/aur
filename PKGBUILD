# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=blender-mcp-git
pkgver=r192.9224fe3
pkgrel=1
pkgdesc="Connect Blender to Claude AI via Model Context Protocol for prompt-assisted 3D modeling"
arch=('any')
url="https://github.com/ahujasid/blender-mcp"
license=('MIT')
depends=('python' 'python-pydantic' 'python-requests' 'python-httpx')
optdepends=('blender: Blender (bpy, mathutils, gpu)' 'python-fastmcp: MCP server support' 'python-supabase: supabase client' 'python-numpy: NumPy')
makedepends=('git' 'python-pip' 'python-tomli')
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

    python -m pip install --root="$pkgdir" --prefix=/usr --no-deps --ignore-installed .

    if [ -f "$pkgdir/usr/bin/blender-mcp" ]; then
        sed -i '1s@^#!.*@#!/usr/bin/python@' "$pkgdir/usr/bin/blender-mcp" || true
    fi

    find "$pkgdir" -name 'direct_url.json' -delete
    python -O -m compileall -q -f -d "" "$pkgdir/usr/lib/" 2>/dev/null || true
    find "$pkgdir" -name '*.pyc' -delete
    find "$pkgdir" -type d -name '__pycache__' -empty -delete

    install -Dm644 addon.py "$pkgdir/usr/share/blender-mcp/addon.py"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
