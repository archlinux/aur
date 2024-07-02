# Maintainer: dasnacl <aur@dasnacl.de>
# Modified based on hyprland-nvidia-nosystemd-git

pkgname=hyprland-nosystemd-git
pkgver=0.41.2.r14.d7ea1b77
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (w/o systemd)"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/Hyprland"
license=('BSD')
depends=(
    cairo
    gcc-libs
    glib2
    glibc
    glslang
    hyprutils
    hyprcursor
    hyprlang
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
    mesa
    opengl-driver
    pango
    pixman
    polkit
    seatd
    tomlplusplus
    vulkan-icd-loader
    vulkan-validation-layers
    wayland
    wayland-protocols
    xcb-proto
    xcb-util
    xcb-util-errors
    xcb-util-image
    xcb-util-keysyms
    xcb-util-renderutil
    xcb-util-wm
    xorg-xwayland
)
makedepends=(
    cmake
    gdb
    git
    hyprwayland-scanner
    jq
    make
    meson
    ninja
    patch
    vulkan-headers
    pkgconf
    xorgproto
)
optdepends=(
  'cmake: to build and install plugins using hyprpm'
  'cpio: to build and install plugins using hyprpm'
  'meson: to build and install plugins using hyprpm'
)
provides=("hyprland=${pkgver%%.r*}")
conflicts=(hyprland)
source=("$pkgname::git+https://github.com/hyprwm/Hyprland.git"
  "git+https://github.com/hyprwm/wlroots-hyprland.git"
  "git+https://github.com/hyprwm/hyprland-protocols.git"
  "git+https://github.com/canihavesomecoffee/udis86.git"
)
b2sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pick_mr() {
    git pull origin pull/$1/head --no-edit
}

prepare() {
    cd hyprland-nosystemd-git
    git submodule init
    git config submodule.subprojects/wlroots-hyprland.url "$srcdir/wlroots-hyprland"
    git config submodule.subprojects/hyprland-protocols.url "$srcdir/hyprland-protocols"
    git config submodule.subprojects/udis86.url "$srcdir/udis86"
    git config submodule.subprojects/tracy.update none
    git -c protocol.file.allow=always submodule update

    git -C subprojects/wlroots-hyprland reset --hard
}

pkgver() {
    git -C hyprland-nosystemd-git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}


build() {
    cd hyprland-nosystemd-git

    export CXXFLAGS="-w"
    meson setup build \
      --wipe \
      --prefix     /usr \
      --libexecdir lib \
      --buildtype  release \
      --wrap-mode  nodownload \
      -D           warning_level=0 \
      -D           b_lto=true \
      -D           b_pie=true \
      -D           default_library=shared \
      -D           xwayland=enabled \
      -D           systemd=disabled

    meson compile -C build
}

package() {
    cd hyprland-nosystemd-git

    meson install -C build --destdir "$pkgdir" 

    # FIXME: remove after xdg-desktop-portal-hyprland disowns hyprland-portals.conf
    rm -rf "$pkgdir/usr/share/xdg-desktop-portal"

    # license
    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
}
