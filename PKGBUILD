# Maintainer: instancer-kirik
pkgname=varchiver
pkgver=0.6.3
pkgrel=1
pkgdesc="A variable archiver and github/aur release manager (serialize your variables first)"
arch=('x86_64')
url="https://github.com/instancer-kirik/varchiver"
license=('GPL3')
depends=(
    'python'
    'python-pyqt6'
    'python-pyqt6-webengine'
    'python-uv'
    'python-psutil'
    'git'  # Required for git operations
    'github-cli'  # Required for GitHub releases
    'ttf-dejavu'  # Required for icons/glyphs
    'libnotify'   # Required for notifications
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-pip'
    'python-installer'
)
optdepends=(
    'python-rarfile: for RAR archive support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("da5cac66d48126c84ce0012f2026322a0f8eb1eada14594886383516c9337dec")  # Will be updated by release manager

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Clean up any existing virtual environment
    rm -rf .venv
    
    # Create and activate virtual environment
    python -m venv .venv
    source .venv/bin/activate
    
    # Install dependencies
    pip install --no-cache-dir -e .
    
    # Build executable with explicit module includes
    pyinstaller --clean --onefile --name varchiver \
        --hidden-import varchiver \
        --hidden-import varchiver.utils \
        --hidden-import varchiver.threads \
        --hidden-import varchiver.widgets \
        --add-data "$pkgname:$pkgname" \
        --collect-all PyQt6 \
        bootstrap.py
    
    # Deactivate virtual environment
    deactivate
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Create necessary directories
    install -dm755 "$pkgdir/usr/share/$pkgname"
    
    # Install executable
    install -Dm755 dist/varchiver "$pkgdir/usr/bin/varchiver"
    
    # Install desktop file and icon
    install -Dm644 varchiver.desktop "$pkgdir/usr/share/applications/varchiver.desktop"
    install -Dm644 varchiver.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/varchiver.svg"
    
    # Install license and readme
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Set correct permissions
    chmod -R 755 "$pkgdir/usr/share/$pkgname"
    find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} \;
}

# Get version from PKGBUILD
get_version() {
    grep '^pkgver=' PKGBUILD | cut -d'=' -f2
}

# Force rebuild during release
force_rebuild() {
    rm -rf pkg/ dist/ *.pkg.tar.zst
    makepkg -f --noconfirm
}
