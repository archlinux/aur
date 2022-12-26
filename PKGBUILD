# Maintainer: tohmais <callum.wishart@protonmail.com>
# Maintainer: hafeoz <hafeoz@kolabnow.com>

_pkgname="hyprland"
pkgname="${_pkgname}-nvidia-hidpi-git"
pkgver=r2042.ga7ed3a5
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (NVIDIA + HiDPI patch)"
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
    xorg-xwayland-hidpi-xprop)
makedepends=(
    git
    cmake
    ninja
    gcc
    gdb
    meson
    vulkan-headers
    wayland-protocols
    xorgproto)
source=("${_pkgname}::git+https://github.com/hyprwm/Hyprland.git"
    "git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
    "git+https://github.com/hyprwm/hyprland-protocols.git"
    "https://gitlab.freedesktop.org/lilydjwg/wlroots/-/commit/6c5ffcd1fee9e44780a6a8792f74ecfbe24a1ca7.patch"
    "nvidia.patch")
conflicts=("${_pkgname}")
provides=(hyprland)
sha256sums=('SKIP'
    'SKIP'
    'SKIP'
    'a37e441c309b35e5d9b5c5c637c96729c5348a523a7eaa25c6e24b1fcc3521a6'
    '522b19656d7c1627ec615b6720182590570560e346c1670f9df002015707b340')
options=(!makeflags !buildflags !strip)

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long 2> /dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    rm -rf subprojects/wlroots subprojects/hyprland-protocols
    git submodule init
    git config submodule.wlroots.url "${srcdir}"/wlroots
    git config submodule.subprojects/hyprland-protocols.url "${srcdir}"/hyprland-protocols
    git -c protocol.file.allow=always submodule update subprojects/wlroots
    git -c protocol.file.allow=always submodule update subprojects/hyprland-protocols
    cd subprojects/wlroots
    git revert -n 18595000f3a21502fd60bf213122859cc348f9af
    patch --forward --strip=1 --input="${srcdir}"/6c5ffcd1fee9e44780a6a8792f74ecfbe24a1ca7.patch
    patch --forward --strip=0 --input="${srcdir}"/nvidia.patch
}

build() {
    cd "${srcdir}/${_pkgname}"
    make fixwlr
    cd "./subprojects/wlroots/" && meson build/ --prefix="${srcdir}/tmpwlr" --buildtype=release && ninja -C build/ && mkdir -p "${srcdir}/tmpwlr" && ninja -C build/ install && cd ../../
    make protocols
    make release
    cd ./hyprctl && make all && cd ..
}

package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/usr/share/wayland-sessions"
    mkdir -p "${pkgdir}/usr/share/hyprland"
    install -Dm755 build/Hyprland -t "${pkgdir}/usr/bin"
    install -Dm755 hyprctl/hyprctl -t "${pkgdir}/usr/bin"
    install -Dm644 assets/*.png -t "${pkgdir}/usr/share/hyprland"
    install -Dm644 example/hyprland.desktop -t "${pkgdir}/usr/share/wayland-sessions"
    install -Dm644 example/hyprland.conf -t "${pkgdir}/usr/share/hyprland"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm755 ../tmpwlr/lib/libwlroots.so.* -t "${pkgdir}/usr/lib"
}
