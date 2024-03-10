# Maintainer: Federico Maria Morrone <aur at morrone dot dev>

pkgname=hyprland-cmake-git
pkgver=0.36.0.r93.335506d5
pkgrel=1
pkgdesc="a highly customizable dynamic tiling Wayland compositor that doesn't sacrifice on its looks."
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/Hyprland"
license=(BSD-3-Clause)
depends=(cairo   # libcairo.so
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
        'cpio: to build and install plugins using hyprpm'
        'meson: to build and install plugins using hyprpm')

provides=("hyprland=${pkgver%%.r*}")
conflicts=(hyprland hyprland-git)
source=("git+https://github.com/hyprwm/Hyprland.git")

b2sums=("SKIP")

prepare() {
        cd Hyprland
        git submodule update --init --recursive
}

build() {
        cd Hyprland
        make all
}

pkgver() {
        git -C Hyprland describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

package() {
        cd Hyprland
        find src \( -name '*.h' -o -name '*.hpp' \) -exec install -Dm0644 {} "$pkgdir/usr/include/hyprland/{}" \;
        pushd subprojects/wlroots/include
        find . -name '*.h' -exec install -Dm0644 {} "$pkgdir/usr/include/hyprland/wlroots/{}" \;
        popd
        pushd subprojects/wlroots/build/include
        find . -name '*.h' -exec install -Dm0644 {} "$pkgdir/usr/include/hyprland/wlroots/{}" \;
        popd
        mkdir -p "$pkgdir/usr/include/hyprland/protocols"
        cp protocols/*-protocol.h "$pkgdir/usr/include/hyprland/protocols"
        pushd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr ..
        popd
        install -Dm0644 -t "$pkgdir/usr/share/pkgconfig" build/hyprland.pc
        install -Dm0644 -t "$pkgdir/usr/share/man/man1" docs/{Hyprland,hyprctl}.1
        install -Dm0755 -t "$pkgdir/usr/bin/" build/Hyprland build/hyprctl/hyprctl build/hyprpm/hyprpm
        install -Dm0644 -t "$pkgdir/usr/share/hyprland/" assets/*.png
        install -Dm0644 -t "$pkgdir/usr/share/wayland-sessions/" "example/hyprland.desktop"
        install -Dm0644 -t "$pkgdir/usr/share/hyprland/" "example/hyprland.conf"
        install -Dm0644 -t "$pkgdir/usr/share/licenses/hyprland/" LICENSE
        find subprojects/wlroots/build -name 'libwlroots.so.*' -type f -execdir \
                install -Dm0755 -t "$pkgdir/usr/lib/" {} \;
}
