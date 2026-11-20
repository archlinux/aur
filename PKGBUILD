# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=volpop
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK4 volume popup and mixer for PulseAudio / PipeWire (replaces pavucontrol)"
arch=('x86_64' 'aarch64')
url="https://github.com/jinzhongjia/volpop"
license=('GPL-3.0-or-later')
depends=(
    'glib2'
    'glibc'
    'gtk4'
    'gtk4-layer-shell'
    'libpulse'
)
makedepends=('meson')
checkdepends=('desktop-file-utils')
# style.css asks for "JetBrainsMono Nerd Font", then "Symbols Nerd Font".
optdepends=(
    'pulse-native-provider: PulseAudio-compatible sound server (pipewire-pulse or pulseaudio)'
    'ttf-jetbrains-mono-nerd: icons and monospace text in the popup'
    'ttf-nerd-fonts-symbols: icons in the popup'
)
# Upstream's tarball is a `meson dist` archive with a published sha256sum.
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('71c4cc61904d01fac7796d2fc016af2278cc154c08d99aebe4319c0907563d3f')

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
