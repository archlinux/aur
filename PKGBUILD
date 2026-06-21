# Maintainer: HcgRandon <me@randon.moe>
pkgname=heaper-bin
pkgver=16.18.0
pkgrel=1
pkgdesc="Your files deserve their story"
arch=('x86_64')
url="https://heaper.de/"
license=('unknown')
depends=('fuse2')
options=(!strip)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/JanLunge/heaper-releases/releases/download/v${pkgver}/Heaper-${pkgver}-x86_64.AppImage"
        "heaper.sh"
        "heaper.desktop")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('b810a3a367f71b35600edcd40f8dda2b434b3cdc5821e2219d5db04d62ced38d'
            '882d4689f2e4f28857ad6d1ed39f69a87ae5e2e5b69f973094306291703fe9a5'
            '22a32e412696d5be061d27ba43f07bc925e9f2fa835e52e377b710826a7371fd')

prepare() {
    cd "$srcdir"
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/usr/share/heaper"
    cp -r squashfs-root/* "$pkgdir/usr/share/heaper/"

    # Fix permissions from AppImage extraction
    chmod -R a+rX "$pkgdir/usr/share/heaper/"

    install -Dm755 "$srcdir/heaper.sh" "$pkgdir/usr/bin/heaper"
    install -Dm644 "$srcdir/heaper.desktop" "$pkgdir/usr/share/applications/heaper.desktop"

    # Install icons
    for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        if [ -f "$pkgdir/usr/share/heaper/usr/share/icons/hicolor/$size/apps/heaper.png" ]; then
            install -Dm644 "$pkgdir/usr/share/heaper/usr/share/icons/hicolor/$size/apps/heaper.png" \
                           "$pkgdir/usr/share/icons/hicolor/$size/apps/heaper.png"
        fi
    done
}
