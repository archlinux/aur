# Maintainer: etonedemid <etonedemid@proton.me>
pkgname=cold-start
pkgver=3.3.1
pkgrel=1
pkgdesc="Top-down twin-stick shooter with wave-based combat - Nintendo Switch homebrew, also playable on PC"
arch=('x86_64')
url="https://github.com/etonedemid/cold-start-nx"
license=('MIT')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'enet')
makedepends=('cmake' 'ninja' 'pkgconf')
optdepends=('miniupnpc: UPnP support for hosting servers')
source=("$pkgname-$pkgver.tar.gz::https://github.com/etonedemid/cold-start-nx/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5dfe4376352cb535b8299901e852a6903e6b90d1f7467853f8f787c42662f0a8')

build() {
    cmake -S "cold-start-nx-$pkgver" \
          -B build \
          -G Ninja \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DPLATFORM_PC=1
    cmake --build build
}

package() {
    # Binary
    install -Dm755 build/cold_start "$pkgdir/opt/cold-start/cold_start"

    # Assets (romfs - loaded relative to working directory)
    cp -r "cold-start-nx-$pkgver/romfs" "$pkgdir/opt/cold-start/romfs"

    # Default config
    install -Dm644 "cold-start-nx-$pkgver/build-pc/config.txt" \
        "$pkgdir/opt/cold-start/config.txt" 2>/dev/null || true

    # Wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/cold-start" << 'EOF'
#!/bin/sh
cd /opt/cold-start
exec ./cold_start "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/cold-start"

    # Icon
    install -Dm644 "cold-start-nx-$pkgver/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/cold-start.png"

    # Desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/cold-start.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Cold Start
Comment=Top-down twin-stick shooter - wave survival
Exec=/usr/bin/cold-start
Icon=cold-start
Terminal=false
Type=Application
Categories=Game;ActionGame;
Keywords=shooter;arcade;waves;switch;homebrew;
DESKTOP

    # License
    install -Dm644 "cold-start-nx-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
