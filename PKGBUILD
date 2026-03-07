# Maintainer: sTiKyt <stikyt@proton.me>

pkgname=lovr-playspace-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Room boundary overlay for OpenXR, made with LÖVR"
arch=('x86_64')
url="https://github.com/SpookySkeletons/lovr-playspace"
license=('MIT')
depends=('libx11' 'gcc-libs' 'glibc' 'bash' 'openxr')
optdepends=('envision: automatic plugin integration')
provides=('lovr-playspace')
conflicts=('lovr-playspace')
source=(
    "LOVR_Playspace-${CARCH}-${pkgver}.AppImage::https://github.com/SpookySkeletons/lovr-playspace/releases/download/${pkgver}/LOVR_Playspace-${CARCH}.AppImage"
    "lovr-playspace.desktop"
    "LICENSE::https://raw.githubusercontent.com/SpookySkeletons/lovr-playspace/refs/heads/main/LICENSE"
)
sha256sums=(
    '996e863b6d4d725d3d18fd3a27b5ea503d55d281c2f15332c2556a1484f503fa'
    'ae3e2566417009e6dfd825785d88d33f6c02b9a7070f8c5bad8d58d83e3be3e9'
    'b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0'
)
noextract=("LOVR_Playspace-${CARCH}-${pkgver}.AppImage")
options=('!strip')

prepare() {
    chmod +x "LOVR_Playspace-${CARCH}-${pkgver}.AppImage"
    ./"LOVR_Playspace-${CARCH}-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Binary
    install -Dm755 squashfs-root/usr/bin/lovr-playspace "$pkgdir/usr/lib/lovr-playspace/lovr-playspace"

    # Bundled libraries
    install -Dm755 -t "$pkgdir/usr/lib/lovr-playspace/" squashfs-root/usr/lib/*.so*

    # Wrapper: sets LD_LIBRARY_PATH so the binary finds its bundled .so files
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/lovr-playspace" << 'EOF'
#!/bin/bash
exec env LD_LIBRARY_PATH=/usr/lib/lovr-playspace /usr/lib/lovr-playspace/lovr-playspace "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/lovr-playspace"

    # Desktop entry (ours, not the bundled one)
    install -Dm644 lovr-playspace.desktop "$pkgdir/usr/share/applications/lovr-playspace.desktop"

    # Icon (extracted from AppImage)
    install -Dm644 \
        squashfs-root/usr/share/icons/hicolor/256x256/apps/lovr-playspace.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/lovr-playspace.png"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
