# Maintainer: taxin <186607085+taxin-404@users.noreply.github.com>

pkgname=ente-photos-bin
pkgver=1.7.31
pkgrel=1
pkgdesc="Desktop client for ente Photos (self-contained AppImage)"
arch=('x86_64')
url="https://ente.com/"
license=('AGPL-3.0-only')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'glib2'
    'gtk3'
    'libcups'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nss'
    'pango'
    'systemd-libs'
)
provides=("ente-desktop=${pkgver}")
conflicts=('ente-desktop' 'ente-desktop-bin' 'ente-desktop-git')
options=('!strip')
source=(
    "ente-${pkgver}-x86_64.AppImage::https://github.com/ente/photos-desktop/releases/download/v${pkgver}/ente-${pkgver}-x86_64.AppImage"
    "LICENSE.upstream::https://raw.githubusercontent.com/ente/photos-desktop/v${pkgver}/LICENSE"
    'ente.sh'
)
sha256sums=(
    '9602c60cbe425fff6abf8fc2e77a83c82a1c848b3fc120583b409e88343fb8b6'
    '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
    '6416a92485fce038a4603057681bfcc0c9bce65c27b0bbe11d86d984b6ce557b'
)

package() {
    cd "$srcdir"
    chmod +x "ente-${pkgver}-x86_64.AppImage"
    "./ente-${pkgver}-x86_64.AppImage" --appimage-extract >/dev/null

    install -d "$pkgdir/opt/ente"
    cp -a squashfs-root/. "$pkgdir/opt/ente/"

    install -Dm755 ente.sh "$pkgdir/usr/bin/ente"

    install -Dm644 squashfs-root/ente.desktop \
        "$pkgdir/usr/share/applications/ente.desktop"
    sed -i 's|^Exec=AppRun --no-sandbox %U$|Exec=ente %U|' \
        "$pkgdir/usr/share/applications/ente.desktop"

    local size
    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/ente.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/ente.png"
    done

    install -Dm644 squashfs-root/resources/io.ente.photos.appdata.xml \
        "$pkgdir/usr/share/metainfo/io.ente.photos.appdata.xml"

    install -Dm644 LICENSE.upstream \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 squashfs-root/LICENSE.electron.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 squashfs-root/LICENSES.chromium.html \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
