# Maintainer: sfnemis <sfnemis@linnote.app>
pkgname=linnote
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast, keyboard-driven scratchpad for Linux with smart calculator, OCR, timers, and 14+ themes"
arch=('x86_64')
url="https://linnote.app"
license=('MIT')
depends=(
    'qt6-base'
    'qt6-svg'
    'kwindowsystem'
    'kglobalaccel'
    'layer-shell-qt'
    'tesseract'
    'tesseract-data-eng'
    'hicolor-icon-theme'
)
makedepends=(
    'cmake'
    'git'
    'qt6-tools'
)
optdepends=(
    'tesseract-data-tur: Turkish OCR support'
    'tesseract-data-deu: German OCR support'
    'tesseract-data-fra: French OCR support'
    'tesseract-data-rus: Russian OCR support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/sfnemis/linnote/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build -j$(nproc)
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install desktop file
    install -Dm644 linnote.desktop "$pkgdir/usr/share/applications/linnote.desktop"
    
    # Install icons
    for size in 16 32 48 64 128 256 512; do
        install -Dm644 "resources/icons/app/linnote-${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/linnote.png"
    done
}
