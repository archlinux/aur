# Maintainer: Dániel Sipka <no1msd@users.noreply.github.com>
pkgname=seance
pkgver=0.1.4
pkgrel=1
pkgdesc='Scrolling terminal multiplexer for running multiple AI coding agents side by side'
arch=('x86_64')
url='https://github.com/no1msd/seance'
license=('MIT')
depends=(
    'gtk4'
    'libadwaita'
    'libnotify'
    'libcanberra'
    'libx11'
    'wayland'
    'libglvnd'
    'fontconfig'
    'glib2'
    'pango'
    'cairo'
    'bash'
    'hicolor-icon-theme'
    'freetype2'
    'harfbuzz'
    'oniguruma'
)
makedepends=(
    'zig>=0.15.2'
    'ncurses'
    'pkg-config'
)

options=(!debug)

source=(
    "$pkgname-$pkgver-src.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-src.tar.gz"
)
sha256sums=(
    'e6286ae2e073dece24c505474506d59a10f763fd46f34433ce8b9650be38f739'
)

prepare() {
    cd "$pkgname-$pkgver"
    ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache" \
        ./ghostty/nix/build-support/fetch-zig-cache.sh
}

build() {
    cd "$pkgname-$pkgver"
    ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache" zig build \
        -p "$srcdir/out" \
        --system "$srcdir/zig-cache/p" \
        -Doptimize=ReleaseSafe \
        -Dstrip=true
}

package() {
    install -d "$pkgdir/usr"
    cp -r "$srcdir/out"/* "$pkgdir/usr/"
    install -Dm644 "$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Avoid file conflicts with ghostty and ncurses packages.
    install -d "$pkgdir/usr/share/seance"
    mv "$pkgdir/usr/share/ghostty" "$pkgdir/usr/share/seance/ghostty"
    mv "$pkgdir/usr/share/terminfo" "$pkgdir/usr/share/seance/terminfo"
}
