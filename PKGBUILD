# Maintainer: AegisCanary

pkgname=sbmusic-bin
pkgver=0.1.0
pkgrel=3
pkgdesc="A free alternative to Spotify"
arch=('x86_64')
url="https://sb-music.com"
license=('custom')

depends=(
    'at-spi2-core'
    'cairo'
    'curl'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'harfbuzz'
    'hicolor-icon-theme'
    'jansson'
    'gcc-libs'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
    'zlib-ng-compat'
)

provides=('sbmusic')
conflicts=('sbmusic')

source=(
    "https://github.com/aegiscanary/sbmusic-bin/releases/download/v${pkgver}/sb-music-desktop-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
    "https://github.com/aegiscanary/sbmusic-bin/releases/download/v${pkgver}/sbmusic.svg"
)

sha256sums=('850cc2e898afe31da604392a9b538f07ddc04a1e3043e6a4883d23fcee18b7ed'
            'df4c5107c62da0710e0b07fc03905b86ce4c2056c834c332a7c0df0f86b03912')

package() {
    cp -rp "$srcdir"/* "$pkgdir/"
    rm -f "$pkgdir"/.PKGINFO "$pkgdir"/.BUILDINFO "$pkgdir"/.MTREE

    install -Dm644 "$srcdir/sbmusic.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/sbmusic.svg"
    install -Dm644 "$srcdir/sbmusic.svg" "$pkgdir/usr/share/pixmaps/sbmusic.svg"

    if [ -f "$pkgdir/usr/bin/sb_music" ]; then
        ln -sf /usr/bin/sb_music "$pkgdir/usr/bin/sbmusic"
    fi

    DESKTOP_FILE=$(find "$pkgdir/usr/share/applications/" -name "*.desktop" | head -n 1)
    if [ -n "$DESKTOP_FILE" ]; then
        sed -i 's/^Icon=.*/Icon=sbmusic/' "$DESKTOP_FILE"
        sed -i 's/^Exec=.*/Exec=sbmusic/' "$DESKTOP_FILE"
    fi
}
