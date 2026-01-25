# Maintainer: tealeg <geoffrey+aur@teale.de>
# Derived from the original wlroots-docs package by : GalaxySnail <me+aur@glxys.nl>

pkgname=wlroots0.19-docs
pkgver=0.19.2
minorver=0.19
pkgrel=1
license=("MIT")
pkgdesc="Modular Wayland compositor library (documentation)"
arch=("any")
url="https://gitlab.freedesktop.org/wlroots/wlroots"
makedepends=(
    "gyosu"
    "wayland"
    "wlroots$minorver=$pkgver"
    "wayland-protocols"
)
source=(
    "https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz"
)
sha256sums=(
    '09a0a8d60104c8b0772fee4f60ba76a89aed7e59dff7659d00960fba06bdf267'
)

build() {
    mkdir -p wayland-headers

    local f
    for f in /usr/share/wayland-protocols/*/*/*.xml wlroots-$pkgver/protocol/*.xml; do
        wayland-scanner server-header "$f" "wayland-headers/$(basename -s .xml "$f")-protocol.h"
    done

    gyosu \
        $(pkg-config --cflags-only-I wlroots-$minorver) \
        -Iwayland-headers \
        -DWLR_USE_UNSTABLE \
        -ffile-prefix-map=/usr/include/= \
        $(find /usr/include/wlroots-$minorver/wlr -type f -not -name vulkan.h)
}

package() {
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    cp -r out/* "$pkgdir/usr/share/doc/$pkgname"
}
