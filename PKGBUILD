# Contributor: Soumeh <soumeh@proton.me>
# Contributor: ttmx <aur@tteles.dev>
pkgname=hytale-launcher
pkgver=1.0.0
pkgrel=1
pkgdesc="Official Hytale game launcher"
arch=('x86_64')
url="https://hytale.com"
license=('custom:proprietary')
depends=('glib2' 'gtk3' 'webkit2gtk-4.1' 'libsoup3')
makedepends=('ostree')
source=("hytale-launcher-${pkgver}.flatpak::https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-latest.flatpak")
sha256sums=('92139fef18d00a25963e94a849753db3c1b922a0db69c101b8aa9995da81ab67')

prepare() {
    cd "$srcdir"

    INPUT_FILE=$(readlink -f "hytale-launcher-${pkgver}.flatpak")
    ostree init --repo=repo --mode=bare-user
    ostree static-delta apply-offline --repo=repo "$INPUT_FILE"

    COMMIT_FILE=$(find "repo/objects" -name "*.commit" | head -n 1)
    if [ -z "$COMMIT_FILE" ]; then
        echo "Could not determine commit hash"
        exit 1
    fi

    COMMIT_HASH="$(basename "$(dirname "$COMMIT_FILE")")$(basename "$COMMIT_FILE" .commit)"
    ostree checkout --repo=repo -U "$COMMIT_HASH" extracted
}

package() {
    cd "$srcdir/extracted/files"

    install -Dm755 bin/hytale-launcher \
        "$pkgdir/usr/bin/hytale-launcher"

    sed -i 's|Exec=hytale-launcher-wrapper|Exec=/usr/bin/hytale-launcher|' \
        "share/applications/com.hypixel.HytaleLauncher.desktop"

    install -Dm644 share/applications/com.hypixel.HytaleLauncher.desktop \
        "$pkgdir/usr/share/applications/com.hypixel.HytaleLauncher.desktop"

    sed -i 's|Exec=hytale-launcher-wrapper|Exec=/usr/bin/hytale-launcher|' \
        "$pkgdir/usr/share/applications/com.hypixel.HytaleLauncher.desktop"

    install -Dm644 share/metainfo/com.hypixel.HytaleLauncher.metainfo.xml \
        "$pkgdir/usr/share/metainfo/com.hypixel.HytaleLauncher.metainfo.xml"

    for size in 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "share/icons/hicolor/${size}/apps/com.hypixel.HytaleLauncher.png" \
            "$pkgdir/share/icons/hicolor/${size}/apps/com.hypixel.HytaleLauncher.png"
    done
}
