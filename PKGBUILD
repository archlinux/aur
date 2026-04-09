# Maintainer: Dániel Sipka <no1msd@users.noreply.github.com>
pkgname=seance
pkgver=0.1.0
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

source=(
    "$pkgname-$pkgver-src.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-src.tar.gz"
)
sha256sums=(
    'aa0b1392edfe4b88c0c9a4918a0872528735dc995deda18d48f20b9df7fd5ac2'
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
