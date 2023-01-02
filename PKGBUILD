# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Omar Pakker

pkgname=wlroots0.15
pkgver=0.15.1
pkgrel=2
license=('MIT')
pkgdesc='Modular Wayland compositor library'
url='https://gitlab.freedesktop.org/wlroots/wlroots'
arch=('x86_64')
depends=(
    'libglvnd'
    'libinput'
    'libpixman-1.so'
    'libseat.so'
    'libudev.so'
    'libvulkan.so'
    'libwayland-client.so'
    'libwayland-server.so'
    'libxcb'
    'libxkbcommon.so'
    'opengl-driver'
    'xcb-util-errors'
    'xcb-util-renderutil'
    'xcb-util-wm'
)
makedepends=(
    'glslang'
    'meson'
    'ninja'
    'systemd'
    'vulkan-headers'
    'wayland-protocols'
    'xorg-xwayland'
)
optdepends=(
    'xorg-xwayland: Xwayland support'
)
provides=(
    'libwlroots.so'
)
options=(
    'debug'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.sig::https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz.sig"
)
sha256sums=('5b92f11a52d978919ed1306e0d54c9d59f1762b28d44f0a2da3ef3b351305373'
            'SKIP')
validpgpkeys=(
    '34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48' # Simon Ser
    '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A' # Drew DeVault
    '4100929B33EEB0FD1DB852797BC79407090047CA' # Sway signing key
)

build() {
    arch-meson \
      --includedir    /usr/include/wlroots0.15 \
      --libdir        /usr/lib/wlroots0.15 \
      wlroots-"$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 wlroots-"$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"


    cd "${pkgdir}"
    # Move libs to /usr/lib, except the .so symlinks
    local f
    for f in usr/lib/wlroots0.15/*; do
      if [[ $f == *.so ]]; then
        ln -srf -- usr/lib/"$(readlink "$f")" "$f"
      elif [[ ! -d $f ]]; then
        mv "$f" usr/lib
      fi
    done
}
