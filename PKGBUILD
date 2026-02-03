# Maintainer: SpeedyNote Team <info@speedynote.org>

pkgname=speedynote
pkgver=1.2.1.6
_tagver=1.2.1-6
pkgrel=2
pkgdesc="Fast note-taking app with PDF annotation, export, and multi-platform sync"
arch=('x86_64' 'aarch64')
url="https://github.com/alpha-liu-01/SpeedyNote"
license=('GPL-3.0-or-later')

# Runtime dependencies
depends=(
    'qt6-base'
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
sha256sums=('9af2735fb40c82adbe7b342607081b4a0206abc08a5c192b375f6091b5cfe7ed')

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
    install -Dm755 "build/NoteApp" "$pkgdir/usr/bin/speedynote"
    
    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/speedynote.desktop" << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=SpeedyNote
Comment=Fast note-taking app with PDF annotation support
Exec=speedynote %F
Icon=speedynote
Terminal=false
StartupNotify=true
Categories=Office;Education;
Keywords=notes;pdf;annotation;writing;
MimeType=application/pdf;
EOF
    
    # Install icon
    install -Dm644 "resources/icons/mainicon.png" "$pkgdir/usr/share/pixmaps/speedynote.png"
    
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

