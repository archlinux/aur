# Maintainer: Keiran <root@keirn.net>

pkgname=dorion-appimage-bin
pkgver=6.13.0
pkgrel=1
pkgdesc="Tiny alternative Discord client with a smaller footprint, snappier startup, themes, plugins and more!"
arch=('x86_64')
url="https://spikehd.github.io/projects/dorion"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme' 'zlib' 'gcc-libs' 'glibc')
provides=('dorion')
conflicts=('dorion')
options=('!strip' '!debug')
source=("Dorion-${pkgver}.AppImage::https://github.com/SpikeHD/Dorion/releases/download/v${pkgver}/Dorion_${pkgver}_amd64.AppImage")
sha256sums=('df97c76b5f0ac4b3769ad490982645dc565ab86b3d92682c149402ac1f38a834')

prepare() {
    cd "$srcdir"
    chmod +x "Dorion-${pkgver}.AppImage"
    ./"Dorion-${pkgver}.AppImage" --appimage-extract > /dev/null
}

package() {
    # Upstream AppImage extracts to squashfs-root at $srcdir
    install -dm755 "$pkgdir/opt/dorion"
    cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/dorion/"

    # Ensure executables are executable
    chmod +x "$pkgdir/opt/dorion/AppRun" "$pkgdir/opt/dorion/AppRun.wrapped" "$pkgdir/opt/dorion/usr/bin/Dorion"

    # Wrapper in /usr/bin
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/dorion" << 'WRAPPER'
#!/bin/sh
exec /opt/dorion/AppRun "$@"
WRAPPER

    # Desktop file - fix Exec/Icon to use lowercase wrapper name
    install -Dm644 "$pkgdir/opt/dorion/usr/share/applications/Dorion.desktop" "$pkgdir/usr/share/applications/dorion.desktop"
    sed -i -e 's/^Exec=.*/Exec=dorion %U/' -e 's/^Icon=.*/Icon=dorion/' "$pkgdir/usr/share/applications/dorion.desktop"

    # Icons - install 512px as dorion.png and symlink for compatibility
    install -Dm644 "$pkgdir/opt/dorion/usr/share/icons/hicolor/512x512/apps/Dorion.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/dorion.png"
    # Also expose other sizes if present (presently empty placeholder dirs upstream, but keep logic)
    if [ -d "$pkgdir/opt/dorion/usr/share/icons" ]; then
        # Ensure hicolor dir exists in system location; copy any additional icons that might be non-empty
        for size in 16x16 32x32 64x64 128x128 256x256 scalable; do
            if [ -f "$pkgdir/opt/dorion/usr/share/icons/hicolor/$size/apps/Dorion.png" ]; then
                install -Dm644 "$pkgdir/opt/dorion/usr/share/icons/hicolor/$size/apps/Dorion.png" "$pkgdir/usr/share/icons/hicolor/$size/apps/dorion.png"
            fi
            # svg case for scalable
            if [ -f "$pkgdir/opt/dorion/usr/share/icons/hicolor/$size/apps/Dorion.svg" ]; then
                install -Dm644 "$pkgdir/opt/dorion/usr/share/icons/hicolor/$size/apps/Dorion.svg" "$pkgdir/usr/share/icons/hicolor/$size/apps/dorion.svg"
            fi
        done
    fi

    # License - from repo root if present
    if [ -f "$startdir/LICENSE" ]; then
        install -Dm644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
