# Maintainer: Lucia <bordiyan20035@gmail.com>
pkgname=opensourcetree-git
pkgver=1.2.9
pkgrel=1
pkgdesc="SourceTree-inspired Git GUI built with PyQt6"
arch=('any')
url="https://github.com/Lucia7Lunadottir/OpenSourceTree"
license=('GPL-3.0-only')

depends=(
    'python-pyqt6'
    'python-numpy'
    'python-pygments'
    'git'
)
optdepends=(
    'git-lfs: Git Large File Storage support'
    'konsole: for interactive SSH authentication in terminal'
    'xterm: alternative terminal for SSH auth'
)

makedepends=('git')

provides=('opensourcetree')
conflicts=('opensourcetree')
source=("opensourcetree::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/opensourcetree"
    git describe --tags --long 2>/dev/null \
        | sed 's/^v//;s/-[0-9]*-g[0-9a-f]*//' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    local _src="$srcdir/opensourcetree"
    local _lib="$pkgdir/usr/lib/opensourcetree"
    install -dm755 "$_lib"

    install -Dm644 "$_src/main.py"    "$_lib/main.py"
    install -Dm644 "$_src/style.qss"  "$_lib/style.qss"

    cp -a "$_src/app"     "$_lib/"
    cp -a "$_src/assets"  "$_lib/"
    cp -a "$_src/locales" "$_lib/"

    find "$_lib" -name '__pycache__' -exec rm -rf {} + 2>/dev/null || true

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/opensourcetree" << 'EOF'
#!/bin/bash
cd /usr/lib/opensourcetree/
exec python3 main.py "$@"
EOF

    install -Dm644 "$_src/OpenSourceTreeIcon.png" \
        "$pkgdir/usr/share/pixmaps/opensourcetree.png"

    install -Dm644 "$_src/opensourcetree.desktop" \
        "$pkgdir/usr/share/applications/opensourcetree.desktop"
}
