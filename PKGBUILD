# Maintainer: unstable-code <assa0620@gmail.com>
pkgname=wshowlyrics
pkgver=0.10.2
pkgrel=1
pkgdesc="Wayland-native lyrics display for MPD with online fallback"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wshowlyrics/wshowlyrics"
license=('GPL-3.0-or-later')
depends=('wayland' 'cairo' 'pango' 'curl' 'fontconfig' 'openssl' 'libappindicator-gtk3' 'gdk-pixbuf2')
optdepends=(
    'snixembed: System tray support for Swaybar'
    'libexttextcat: Language detection for translation validation'
)
makedepends=('meson' 'ninja' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/wshowlyrics-v$pkgver.tar.gz")
sha256sums=('0355279f56fc5f869d109b42b80b1d31e5327be1270ce37e6abf9312111b2119')

build() {
    cd "wshowlyrics-v$pkgver"
    # Ensure a fresh meson setup. Without this, a cached build/ from an
    # older meson minor version (e.g. 1.10 -> 1.11) refuses to compile
    # for users who pass `makepkg -e` (skip extract).
    rm -rf build
    arch-meson . build
    meson compile -C build
}

check() {
    cd "wshowlyrics-v$pkgver"
    # Verify binary was built successfully
    test -f build/lyrics
    # Verify helper script exists
    test -f wshowlyrics-offset
}

package() {
    cd "wshowlyrics-v$pkgver"
    meson install -C build --destdir="$pkgdir"

    # Rename binary from lyrics to wshowlyrics
    mv "$pkgdir/usr/bin/lyrics" "$pkgdir/usr/bin/wshowlyrics"
}
