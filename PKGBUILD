# Maintainer: unstable-code <assa0620@gmail.com>
pkgname=wshowlyrics
pkgver=0.9.9
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
sha256sums=('c08f9b780b2800dfa830d9b4fd23af693432018c9e6da6fd0490f855c90368b7')

build() {
    cd "wshowlyrics-v$pkgver"
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
