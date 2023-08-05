# Maintainer: GalaxySnail <me+aur@glxys.nl>

pkgname=wlroots-docs
pkgver=0.16.2
pkgrel=1
license=("MIT")
pkgdesc="Modular Wayland compositor library (documentation)"
arch=("any")
url="https://gitlab.freedesktop.org/wlroots/wlroots"
makedepends=(
    "gyosu"
    "wayland"
    "wlroots=$pkgver"
    "wayland-protocols"
)
source=(
    "https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz"
)
sha256sums=(
    "83e9a11605f23d4bf781ab1947089483d9ec3f7e9ba65398e0609593b77d44aa"
)

build() {
    mkdir -p wayland-headers

    local f
    for f in /usr/share/wayland-protocols/*/*/*.xml wlroots-$pkgver/protocol/*.xml; do
        wayland-scanner server-header "$f" "wayland-headers/$(basename -s .xml "$f")-protocol.h"
    done

    gyosu \
        $(pkg-config --cflags-only-I wlroots) \
        -Iwayland-headers \
        -DWLR_USE_UNSTABLE \
        -ffile-prefix-map=/usr/include/= \
        $(find /usr/include/wlr -type f -not -name vulkan.h)
}

package() {
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    cp -r out/* "$pkgdir/usr/share/doc/$pkgname"
}
