# Maintainer: instancer-kirik
pkgname=varchiver
pkgver=0.4.5
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
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-pip'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("45033d677c6c6a90915b64bec4700eb6855dfb64a2af1b9bd1dac2013dd1e9eb")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # Create and activate virtual environment
    python -m venv .venv
    source .venv/bin/activate
    
    # Install dependencies including PyInstaller
    uv pip install .
    uv pip install pyinstaller
    
    # Build executable
    python -m PyInstaller --clean --onefile --name varchiver bootstrap.py
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    # Install executable
    install -Dm755 dist/varchiver "$pkgdir/usr/bin/varchiver"
    
    # Install desktop file and icon
    install -Dm644 varchiver.desktop "$pkgdir/usr/share/applications/varchiver.desktop"
    install -Dm644 varchiver.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/varchiver.svg"
    
    # Install license and readme
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Get version from PKGBUILD
get_version() {
    grep '^pkgver=' PKGBUILD | cut -d'=' -f2
}

# Force rebuild during release
force_rebuild() {
    rm -rf pkg/ src/ *.pkg.tar.zst
    makepkg -f --noconfirm --skipchecksums
}
