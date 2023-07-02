# Maintainer: Kuan-Yen Chou <kychou2@illinois.edu>

pkgname=wlroots-nvidia-git
pkgver=0.16.0.r623.gbbd53b3b
pkgrel=1
pkgdesc='Modular Wayland compositor library (git version with nvidia patches)'
depends=(libglvnd libinput libudev.so libxcb libxkbcommon libdisplay-info
         libliftoff opengl-driver pixman wayland xcb-util-errors
         xcb-util-renderutil xcb-util-wm seatd vulkan-icd-loader
         vulkan-validation-layers xorg-xwayland)
makedepends=(git glslang meson ninja systemd vulkan-headers wayland-protocols
             xorg-xwayland)
optdepends=('xorg-xwayland: Xwayland support')
arch=(x86_64)
url="https://gitlab.freedesktop.org/wlroots/wlroots"
license=(MIT)
provides=(wlroots wlroots-git)
conflicts=(wlroots wlroots-git)
source=("$pkgname::git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
        "nvidia.patch")
sha256sums=('SKIP'
            '96d948ba58376178420bed763820fd274d230a1f7a82873a5b63de4c9a14e15f')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np0 -i "$srcdir/nvidia.patch"
}

build() {
    cd "$srcdir/$pkgname"
	arch-meson --buildtype=release -Dwerror=false -Dexamples=false . build
	ninja -C build
}

package() {
    cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/wlroots"
}

# vim: set sw=4 ts=4 et:
