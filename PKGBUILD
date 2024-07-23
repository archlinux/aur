# Maintainer: Adrianne Scales <adriannepscales at gmail dot com>

pkgname=wlroots0.17-nvidia
pkgver=0.17.4
pkgrel=1
license=('MIT')
pkgdesc='Patched version of the wlroots library specifically used by the sway package. This one is compatible with the Nvidia proprietary driver and eliminates flickering. (Not to be confused with the wlroots-nvidia package.)'
wl_pkgname="wlroots0.17"
url='https://gitlab.freedesktop.org/wlroots/wlroots'
arch=('x86_64')
depends=(
    'libdisplay-info.so'
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
conflicts=(
    'wlroots0.17'
)
source=(
    "https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz"
    "https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz.sig"
    "Revert-layer-shell-error-on-0-dimension-without-anch.patch"
    "nvidia.patch"
)
validpgpkeys=(
    '34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48' # Simon Ser
    '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A' # Drew DeVault
    '4100929B33EEB0FD1DB852797BC79407090047CA' # Sway signing key
)
sha256sums=('d3190d19d03446955e68a92c77d4c74af78384b0db39a85a0b1582adc80f36d1'
            'SKIP'
            '1c05f0500a96a3721317d01619aa42d8ad696905a378249e8405968c4e16a065'
            '852ed6ddced4ebce329bc471ae64b36a2a33e3551bb756ea89808dc4ac0a1b2b')

prepare() {
    cd wlroots-"${pkgver}"
    # Allow a minor protocol violation until phosh is fixed without this patch
    # phosh crashes on launch.
    patch -Np1 -i "${srcdir}/Revert-layer-shell-error-on-0-dimension-without-anch.patch"

    # Allow for GLES2 rendering with NVIDIA
    patch -Np1 -i "${srcdir}/nvidia.patch"
}

build() {
    arch-meson \
      --includedir    /usr/include/wlroots0.17 \
      --libdir        /usr/lib/wlroots0.17 \
      wlroots-"${pkgver}" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 "wlroots-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

    cd "${pkgdir}"
    # Move libs to /usr/lib, except the .so symlinks
    local f
    for f in usr/lib/wlroots0.17/*; do
      if [[ $f == *.so ]]; then
        ln -srf -- usr/lib/"$(readlink "$f")" "$f"
      elif [[ ! -d $f ]]; then
        mv "$f" usr/lib
      fi
    done
}

groups=('modified')


