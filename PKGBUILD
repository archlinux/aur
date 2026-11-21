# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=btpop
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK4 Bluetooth popup and pairing agent for BlueZ (replaces blueman)"
arch=('x86_64' 'aarch64')
url="https://github.com/jinzhongjia/btpop"
license=('GPL-3.0-or-later')
# bluez: btpop talks to bluetoothd over D-Bus directly, with no other
# Bluetooth library; rfkill unblocking goes through /dev/rfkill.
depends=(
    'bluez'
    'glib2'
    'glibc'
    'gtk4'
    'gtk4-layer-shell'
)
makedepends=('meson')
checkdepends=('desktop-file-utils')
# style.css asks for "JetBrainsMono Nerd Font", then "Symbols Nerd Font".
optdepends=(
    'ttf-jetbrains-mono-nerd: icons and monospace text in the popup'
    'ttf-nerd-fonts-symbols: icons in the popup'
)
# Upstream's tarball is a `meson dist` archive with a published sha256sum.
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('96ddca06b3e2223d4ecb304784e64230a57511329732d87c3855f5b703b9908a')

build() {
    arch-meson "$pkgname-$pkgver" build \
        -Dui=enabled \
        -Dlayer_shell=enabled
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
