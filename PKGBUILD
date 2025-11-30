pkgname=comfyengine-git
pkgver=0.r3.g1befc2d
pkgrel=1
pkgdesc="Qt-based memory scanner inspired by Cheat Engine, works natively on Linux. Made by Kashi."
arch=('x86_64')
url="https://github.com/kashithecomfy/ComfyEngine"
license=('MIT')
depends=('qt6-base' 'capstone')
makedepends=('git' 'cmake' 'ninja' 'qt6-tools')
provides=('comfyengine')
conflicts=('comfyengine')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/ComfyEngine"

    # Try tags first
    local ver
    ver=$(git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./')

    # If git describe worked, use it
    if [[ -n "$ver" ]]; then
        echo "$ver"
        return
    fi

    # Fallback for repos with no tags
    echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/ComfyEngine"
    cmake -S . -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$srcdir/ComfyEngine"

    # Install built files to pkgdir
    DESTDIR="$pkgdir" cmake --install build

    # Ensure the binary is installed
    install -Dm755 build/src/comfyengine "$pkgdir/usr/bin/comfyengine"

    # Helper binary (only test_watch exists)
    install -Dm755 test_watch "$pkgdir/usr/lib/comfyengine/test_watch"

    # Desktop entry (located OUTSIDE src/)
    install -Dm644 "$srcdir/../comfyengine.desktop" \
        "$pkgdir/usr/share/applications/comfyengine.desktop"

    # Icons (optional)
    if [[ -f "$srcdir/../comfyengine.png" ]]; then
        install -Dm644 "$srcdir/../comfyengine.png" \
            "$pkgdir/usr/share/icons/hicolor/128x128/apps/comfyengine.png"
    fi

    if [[ -f "$srcdir/../comfyengine.svg" ]]; then
        install -Dm644 "$srcdir/../comfyengine.svg" \
            "$pkgdir/usr/share/icons/hicolor/scalable/apps/comfyengine.svg"
    fi
}

