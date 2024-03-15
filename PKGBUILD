# Maintainer: Federico Maria Morrone <aur at morrone dot dev>

pkgname=hyprland-cmake-git
pkgver=0.36.0.r116.ga958884b
pkgrel=1
pkgdesc="a highly customizable dynamic tiling Wayland compositor that doesn't sacrifice on its looks."
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/Hyprland"
license=(BSD-3-Clause)
depends=(
        cpio     # needed by hyprpm
        cairo    # libcairo.so
        gcc-libs # libgcc_s.so libstdc++.so
        glibc    # libc.so libm.so
        glib2 libgobject-2.0.so
        glslang
        hyprlang libhyprlang.so
        hyprcursor
        libdisplay-info libdisplay-info.so
        libdrm # libdrm.so
        libglvnd libEGL.so libGLESv2.so libOpenGL.so
        libinput # libinput.so
        libliftoff libliftoff.so
        libx11
        libxcb        # libxcb-dri3.so libxcb-present.so libxcb-render.so libxcb-res.so libxcb-shm.so libxcb.so libxcb-xfixes.so libxcb-xinput.so
        libxcomposite # libxcb-composite.so
        libxfixes
        libxkbcommon libxkbcommon.so
        libxrender
        mesa # libgbm.so
        opengl-driver
        pango libpango-1.0.so libpangocairo-1.0.so
        pixman libpixman-1.so
        polkit
        seatd libseat.so
        systemd-libs libsystemd.so
        tomlplusplus libtomlplusplus.so libudev.so
        vulkan-icd-loader
        vulkan-validation-layers
        wayland libwayland-client.so libwayland-server.so
        wayland-protocols
        xcb-proto
        xcb-util
        xcb-util-errors # libxcb-errors.so
        xcb-util-keysyms
        xcb-util-renderutil # libxcb-render-util.so
        xcb-util-wm         # libxcb-ewmh.so  libxcb-icccm.so
        xorg-xinput
        xorg-xwayland)
makedepends=(cmake
        gdb
        meson
        ninja
        vulkan-headers
        xorgproto)
optdepends=('cmake: to build and install plugins using hyprpm'
        'meson: to build and install plugins using hyprpm')

provides=("hyprland=${pkgver%%.r*}")
conflicts=(hyprland hyprland-git)
source=("git+https://github.com/hyprwm/Hyprland.git")

b2sums=("SKIP")

prepare() {
        cd Hyprland
        git submodule update --init --recursive
        sed -i -e '/^release:/{n;s/-D/-DCMAKE_SKIP_RPATH=ON -D/}' Makefile
}

build() {
        make -C Hyprland PREFIX=/usr release
}

pkgver() {
        git -C Hyprland describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' |
                sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
        cd Hyprland
        make PREFIX=$pkgdir/usr install
}
