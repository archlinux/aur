# Maintainer: mileswithtails_ <gabmaykin@bk.ru>
pkgname=segasonic-port-git
pkgver=1.0.r89.gddfc87e
pkgrel=1
pkgdesc="A native port of SegaSonic The Hedgehog (Sega arcade, 1993)"
arch=('x86_64' 'aarch64')
url="https://github.com/cheviman/segasonic-port"
license=('BSD')
depends=('gcc-libs' 'glibc' 'sdl2')
makedepends=('git' 'cmake' 'python')
provides=('segasonic-port')
conflicts=('segasonic-port')
options=('!lto')
source=("$pkgname::git+https://github.com/cheviman/segasonic-port")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    local ver
    ver=$(sed -n 's/^project(segasonic-port VERSION \([0-9][0-9.]*\).*/\1/p' CMakeLists.txt | head -n1)
    [ -z "$ver" ] && ver="1.0"

    printf '%s.r%s.g%s' "$ver" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    cmake -S . -B build/cmake -DSEGASONIC_REFERENCE_TOOLS=OFF
    cmake --build build/cmake --config Release
}

package() {
    install -Dm755 "$srcdir/$pkgname/build/bin/SegaSonic" "$pkgdir/usr/bin/segasonic-port"
    install -Dm755 "$srcdir/$pkgname/build/bin/SegaSonic Arcade" "$pkgdir/usr/bin/segasonic-port-arcade"

    install -Dm644 "$srcdir/$pkgname/build/bin/segasonic.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/segasonic-port.png"

    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/segasonic-port.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Version=1.0
Name=SegaSonic The Hedgehog
GenericName=Arcade game
Comment=A native port of SegaSonic The Hedgehog. Requires original ROM (sonic.zip) on first launch.
Exec=segasonic-port
Icon=segasonic-port
Terminal=false
Categories=Game;ArcadeGame;
Keywords=sonic;sega;arcade;
StartupNotify=true
EOF
}
