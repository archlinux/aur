# Maintainer: Julian Poidevin <poidevin dot julian at gmail dot com>

_pkgname="hyprland"
pkgname="${_pkgname}-displaylink-git"
pkgver="0.26.0"
pkgrel=3
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (DisplayLink patch)"
arch=(any)
url="https://github.com/hyprwm/Hyprland"
license=('BSD')
depends=(
    libxcb
    xcb-proto
    xcb-util
    xcb-util-keysyms
    libxfixes
    libx11
    libxcomposite
    xorg-xinput
    libxrender
    pixman
    wayland-protocols
    cairo
    pango
    polkit
    glslang
    libinput
    libxcb
    libxkbcommon
    opengl-driver
    pixman
    wayland
    xcb-util-errors
    xcb-util-renderutil
    xcb-util-wm
    seatd
    vulkan-icd-loader
    vulkan-validation-layers
    xorg-xwayland
    libliftoff
    libdisplay-info)
makedepends=(
    git
    cmake
    ninja
    gcc
    gdb
    meson
    vulkan-headers
    xorgproto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hyprwm/Hyprland/releases/download/v${pkgver}/source-v${pkgver}.tar.gz"
        "displaylink.patch")
conflicts=("${_pkgname}")
provides=(hyprland)
sha256sums=('096e478f9f8f4b16bd3d3313f970e216d4ca0d280f6cfddf35126ff8f4350497'
            '444bcd0f95ea7955a02da1a99481f33da6f7a4c4d0e6b06d3c3bda8133671484')
options=(!makeflags !buildflags !strip)

prepare() {
    cd "$srcdir/hyprland-source"
    patch --directory="$srcdir/hyprland-source/subprojects/wlroots/" --forward --strip=0 \
        --input="${srcdir}/displaylink.patch"
}

build() {
    cd "$srcdir/hyprland-source"
    make fixwlr
    cd "./subprojects/wlroots/" && meson build/ --prefix="${srcdir}/tmpwlr" --buildtype=release && ninja -C build/ && mkdir -p "${srcdir}/tmpwlr" && ninja -C build/ install && cd ../
    cd udis86 && cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -H./ -B./build -G Ninja && cmake --build ./build --config Release --target all -j$(shell nproc) && cd ../..
    make protocols
    make release
    cd ./hyprctl && make all && cd ..
}

package() {
    cd "$srcdir"
    mkdir -p "${pkgdir}/usr/share/wayland-sessions"
    mkdir -p "${pkgdir}/usr/share/hyprland"
    install -Dm755 hyprland-source/build/Hyprland -t "${pkgdir}/usr/bin"
    install -Dm755 hyprland-source/hyprctl/hyprctl -t "${pkgdir}/usr/bin"
    install -Dm644 hyprland-source/assets/*.png -t "${pkgdir}/usr/share/hyprland"
    install -Dm644 hyprland-source/example/hyprland.desktop -t "${pkgdir}/usr/share/wayland-sessions"
    install -Dm644 hyprland-source/example/hyprland.conf -t "${pkgdir}/usr/share/hyprland"
    install -Dm644 hyprland-source/LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm755 "${srcdir}/tmpwlr/lib/libwlroots.so.12032" -t "${pkgdir}/usr/lib"
}
