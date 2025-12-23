# Maintainer: unstable-code <assa0620@gmail.com>
pkgname=wshowlyrics
pkgver=0.8.5
pkgrel=1
pkgdesc="Wayland-native lyrics display for MPD with online fallback"
arch=('x86_64' 'aarch64')
url="https://github.com/unstable-code/lyrics"
license=('GPL-3.0-or-later')
depends=('wayland' 'cairo' 'pango' 'curl' 'fontconfig' 'openssl' 'libappindicator-gtk3' 'gdk-pixbuf2')
optdepends=(
    'snixembed: System tray support for Swaybar'
    'libexttextcat: Language detection for translation validation'
)
makedepends=('meson' 'ninja' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('da3b4d16ec93abdcb8d807a201a21bafc2628f9dfa7e19e51599bee4ad5e564a')

build() {
    cd "lyrics-$pkgver"
    arch-meson . build
    meson compile -C build
}

check() {
    cd "lyrics-$pkgver"
    # Verify binary was built successfully
    test -f build/lyrics
    # Verify helper script exists
    test -f wshowlyrics-offset
}

package() {
    cd "lyrics-$pkgver"
    meson install -C build --destdir="$pkgdir"

    # Rename binary from lyrics to wshowlyrics
    mv "$pkgdir/usr/bin/lyrics" "$pkgdir/usr/bin/wshowlyrics"
}
