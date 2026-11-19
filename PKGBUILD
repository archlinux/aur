# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=netpop
pkgver=0.2.0
pkgrel=1
pkgdesc="GTK4 NetworkManager popup, connection editor and secret agent (replaces nm-applet / nm-connection-editor)"
arch=('x86_64' 'aarch64')
url="https://github.com/jinzhongjia/netpop"
license=('GPL-3.0-or-later')
# networkmanager: netpop is a frontend for the NetworkManager daemon; libnm
# alone only provides the client library.
depends=(
    'glib2'
    'glibc'
    'gtk4'
    'gtk4-layer-shell'
    'libnm'
    'libsecret'
    'networkmanager'
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
sha256sums=('f2f0a58b94ca0ce8bdb5d29ead6a465e93bdc991cb599c0f1a169b32d748b67f')

build() {
    arch-meson "$pkgname-$pkgver" build \
        -Dlayer_shell=enabled \
        -Dkeyring=enabled
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
