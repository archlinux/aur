# Maintainer: tohmais <callum.wishart@protonmail.com>
# Contributor: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=hyprland-nvidia-git
pkgver=0.31.0.r105.g29e0a711
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (NVIDIA patch)"
arch=(any)
url="https://github.com/hyprwm/Hyprland"
license=('BSD')
depends=(
    cairo
    gcc-libs
    glibc
    glslang
    libdisplay-info
    libdrm
    libglvnd
    libinput
    libliftoff
    libx11
    libxcb
    libxcomposite
    libxfixes
    libxkbcommon
    libxrender
    opengl-driver
    pango
    pixman
    polkit
    seatd
    systemd-libs
    vulkan-icd-loader
    vulkan-validation-layers
    wayland
    wayland-protocols
    xcb-proto
    xcb-util
    xcb-util-errors
    xcb-util-keysyms
    xcb-util-renderutil
    xcb-util-wm
    xorg-xinput
    xorg-xwayland
)
makedepends=(
    cmake
    gdb
    git
    meson
    ninja
    vulkan-headers
    xorgproto
)
provides=(hyprland)
conflicts=(hyprland)
source=("$pkgname::git+https://github.com/hyprwm/Hyprland.git")
sha256sums=('SKIP')

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
    git submodule update --init
    sed -E -i -e 's/(soversion = 12)([^032]|$$)/soversion = 12032/g' ./subprojects/wlroots/meson.build
    rm -rf ./subprojects/wlroots/build
    sed -i -e '/^release:/{n;s/-D/-DCMAKE_SKIP_RPATH=ON -D/}' Makefile
    cd "$srcdir/$pkgname/subprojects/wlroots"
    patch -Np1 < "$srcdir/$pkgname/nix/patches/wlroots-nvidia.patch"
}

build() {
    # Build wlroots
    cd "$srcdir/$pkgname/subprojects/wlroots"
    meson build/ --prefix="$srcdir/tmpwlr" --buildtype=release
    ninja -C build/
    mkdir -p "$srcdir/tmpwlr"
    ninja -C build/ install

    # Build udis86
    cd "$srcdir/$pkgname/subprojects/udis86"
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -G Ninja
    cmake --build build --config Release --target all

    # Build hyprland
    cd "$srcdir/$pkgname"
    make all
    make -C hyprctl all
}

package() {
    # Install hyprland headers
    cd "$srcdir/$pkgname"
    find src -name '*.h*' -exec install -Dm644 {} "$pkgdir/usr/include/hyprland/{}" \;

    # Fix $srcdir reference
    sed -i -e "/ICONDIR/ s,$srcdir/tmpwlr,/usr," "$srcdir/$pkgname/subprojects/wlroots/build/include/config.h"

    # Install wlroots headers
    cd "$srcdir/$pkgname/subprojects/wlroots/include"
    find . -name '*.h' -exec install -Dm644 {} "$pkgdir/usr/include/hyprland/wlroots/{}" \;
    cd "$srcdir/$pkgname/subprojects/wlroots/build/include"
    find . -name '*.h' -exec install -Dm644 {} "$pkgdir/usr/include/hyprland/wlroots/{}" \;

    # Install hyprland
    cd "$srcdir/$pkgname/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    cd "$srcdir/$pkgname"
    install -Dm755 -t "$pkgdir/usr/bin" build/Hyprland
    install -Dm755 -t "$pkgdir/usr/bin" hyprctl/hyprctl
    install -Dm644 -t "$pkgdir/usr/include/hyprland/protocols" protocols/*-protocol.h
    install -Dm644 -t "$pkgdir/usr/share/hyprland" assets/*.png
    install -Dm644 -t "$pkgdir/usr/share/hyprland" example/hyprland.conf
    install -Dm644 -t "$pkgdir/usr/share/licenses/hyprland" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/pkgconfig" build/hyprland.pc
    install -Dm644 -t "$pkgdir/usr/share/wayland-sessions" example/hyprland.desktop
    install -Dm755 -t "$pkgdir/usr/lib" "$srcdir/tmpwlr/lib/libwlroots.so.12032"
}
