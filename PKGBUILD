# Maintainer: unstable-code <assa0620@gmail.com>
pkgname=wshowlyrics
pkgver=0.11.0
pkgrel=1
pkgdesc="Wayland-native lyrics display for MPD with online fallback"
arch=('x86_64' 'aarch64')
url="https://github.com/wshowlyrics/wshowlyrics"
license=('GPL-3.0-or-later')
depends=('wayland' 'cairo' 'pango' 'curl' 'fontconfig' 'openssl' 'libappindicator-gtk3' 'gdk-pixbuf2')
optdepends=(
    'snixembed: System tray support for Swaybar'
    'libexttextcat: Language detection for translation validation'
)
makedepends=('meson' 'ninja' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f09cc8856bb636feb53fce7001dd564fdb4199883db1fe5d3822b75d0743edfe')

build() {
    cd "wshowlyrics-$pkgver"
    # Ensure a fresh meson setup. Without this, a cached build/ from an
    # older meson minor version (e.g. 1.10 -> 1.11) refuses to compile
    # for users who pass `makepkg -e` (skip extract).
    rm -rf build
    arch-meson . build
    meson compile -C build
}

check() {
    cd "wshowlyrics-$pkgver"
    # Verify binary was built successfully
    test -f build/lyrics
    # Verify helper script exists
    test -f wshowlyrics-offset
}

package() {
    cd "wshowlyrics-$pkgver"
    meson install -C build --destdir="$pkgdir"

    # Rename binary from lyrics to wshowlyrics
    mv "$pkgdir/usr/bin/lyrics" "$pkgdir/usr/bin/wshowlyrics"

    # Install licenses (THIRD_PARTY_LICENSES.md ships from the release after v0.10.2)
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    if [[ -f THIRD_PARTY_LICENSES.md ]]; then
        install -Dm644 THIRD_PARTY_LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.md"
    fi
}
