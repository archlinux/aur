# Upstream: RuneScape Linux <noreply@jagex.com>
# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=runescape-launcher
pkgver=2.1.1
pkgrel=1
pkgdesc="RuneScape MMORPG – NXT client core"
arch=(x86_64)
license=(custom)
url="https://www.runescape.com/"
depends=(
    glew1.10
    libcurl-compat
    libpng12
    libvorbis
    sdl2
    webkitgtk2
    desktop-file-utils
    gtk-update-icon-cache
)
conflicts=(runescape-launcher-nxt)
provides=(runescape-launcher-nxt)
install=$pkgname.install
source=("wrapper.sh"
        "runescape.16.png"
        "runescape.24.png"
        "runescape.32.png"
        "runescape.48.png"
        "runescape.256.png")
source_x86_64=("https://content.runescape.com/downloads/ubuntu/pool/non-free/r/$pkgname/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('a69a588d96cba03b9fcf13a7230a1a8e4f0591db5c241574924a8596c7cd615b'
            'aa9da8d88067696bf60d79e9d429b1fa6ffbfc533788163c5d2950693854d8bd'
            'c92824f99f8c8a816d276bf5112c714956557b8b327fbfa5889e4c72496e5f23'
            '2631c9237f40d9612e4da53c9f066ca48213069d04f643f3b51897d8e369e49e'
            '592ab440e04ed28a4684b94dea1262d7353291512e62180e80585ebaf5981bf3'
            '35ace263a49a53128290d14a8ad7038533ca8a5da83efa110c5998065b35d738')
sha256sums_x86_64=('708283eb0d34b93a551c99bd7b456a7b6fc590c16f4f26a1b4b851cc7088c4bd')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"

    bsdtar xf ../control.tar.gz
    bsdtar xf ../data.tar.xz
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    cp -a usr "$pkgdir"

    mv "$pkgdir"/usr/bin/runescape-launcher{,.real}
    install -Dm0644 "$pkgdir"/usr/share/games/$pkgname/runescape.png \
                    "$pkgdir"/usr/share/icons/hicolor/64x64/apps/runescape.png
    for size in 16 24 32 48 256; do
        install -Dm0644 ../runescape.$size.png \
                        "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/runescape.png
    done
    sed -i 's/^Icon=.*/Icon=runescape/;s/^Version=.*/Version=1.0/;s/^Catagories=/Categories=/' "$pkgdir"/usr/share/applications/runescape-launcher.desktop

    install -Dm0755 ../wrapper.sh "$pkgdir"/usr/bin/runescape-launcher
    install -Dm0644 copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: ft=sh:ts=4:sw=4:et:nowrap
