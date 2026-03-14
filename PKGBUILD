# Maintainer: SpeedyNote Team <info@speedynote.org>

pkgname=speedynote
pkgver=1.3.1
_tagver=1.3.1
pkgrel=1
pkgdesc="Fast note-taking app with PDF annotation, export, and multi-platform sync"
arch=('x86_64' 'aarch64')
url="https://github.com/alpha-liu-01/SpeedyNote"
license=('GPL-3.0-or-later')

# Runtime dependencies
depends=(
    'qt6-base'
    'qt6-svg'
    'mupdf'            # PDF rendering and export
    'harfbuzz'
    'freetype2'
    'libjpeg-turbo'
    'openjpeg2'
    'jbig2dec'
    'gumbo-parser'
    'mujs'
    'brotli'
    'zlib'
)


# Build dependencies
makedepends=(
    'cmake'
    'pkgconf'
    'qt6-tools'        # For lrelease (translations)
)

# Package conflicts
provides=('speedynote')
conflicts=('speedynote-bin' 'speedynote-git' 'speedynote-src')

# Source from GitHub release
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('f1ae94ac546c1a0e554aba6c0bfe7660e2a7f805302a86dcc087a434fe07ca92')

build() {
    cd "SpeedyNote-${_tagver}"
    
    # Create build directory
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    
    # Build with parallel jobs (use half cores to avoid OOM on low-RAM systems)
    local jobs=$(( ($(nproc) + 1) / 2 ))
    cmake --build build --parallel "$jobs"
}

package() {
    cd "SpeedyNote-${_tagver}"
    
    # Install binary
    install -Dm755 "build/speedynote" "$pkgdir/usr/bin/speedynote"
    
    # Install desktop file (committed in repo)
    install -Dm644 "data/org.speedynote.SpeedyNote.desktop" "$pkgdir/usr/share/applications/org.speedynote.SpeedyNote.desktop"
    
    # Install SVG icon (scalable + pixmaps fallback, name matches Icon= in .desktop file)
    install -Dm644 "resources/icons/mainicon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.speedynote.SpeedyNote.svg"
    install -Dm644 "resources/icons/mainicon.svg" "$pkgdir/usr/share/pixmaps/org.speedynote.SpeedyNote.svg"
    
    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install translation files (if compiled)
    if ls build/*.qm 1>/dev/null 2>&1; then
        install -dm755 "$pkgdir/usr/share/speedynote/translations"
        install -Dm644 build/*.qm "$pkgdir/usr/share/speedynote/translations/"
    fi
    
    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
