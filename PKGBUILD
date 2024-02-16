# Maintainer: dasnacl <aur@dasnacl.de>
# Modified based on hyprland-nvidia-nosystemd-git

pkgname=hyprland-nosystemd-git
pkgver=0.35.0.r38.gfbf5ba87
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
    tomlplusplus
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
depends+=(libdisplay-info.so)
makedepends=(
    cmake
    gdb
    git
    jq
    meson
    ninja
    vulkan-headers
    pkgconf
    xorgproto
)
provides=("hyprland=${pkgver%%.r*}")
conflicts=(hyprland)
source=("$pkgname::git+https://github.com/hyprwm/Hyprland.git"
  "git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
  "git+https://github.com/hyprwm/hyprland-protocols.git"
  "git+https://github.com/canihavesomecoffee/udis86.git"
  "git+https://github.com/wolfpld/tracy.git"
)
b2sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pick_mr() {
    git pull origin pull/$1/head --no-edit
}

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

prepare() {
    cd hyprland-nosystemd-git
    git submodule init
    git config submodule.wlroots.url "$srcdir/wlroots"
    git config submodule.subprojects/hyprland-protocols.url "$srcdir/hyprland-protocols"
    git config submodule.subprojects/udis86.url "$srcdir/udis86"
    git config submodule.subprojects/tracy.url "$srcdir/tracy"
    git -c protocol.file.allow=always submodule update

    git -C subprojects/wlroots reset --hard
    sed -E -i -e "s/(soversion = .*$)/soversion = 13032/g" subprojects/wlroots/meson.build
}

build() {
    cd hyprland-nosystemd-git

    meson setup build \
      --prefix     /usr \
      --libexecdir lib \
      --sbindir    bin \
      --buildtype  release \
      --wrap-mode  nodownload \
      -D           b_lto=true \
      -D           b_pie=true \
      -D           default_library=shared \
      -D           xwayland=enabled \
      -D           systemd=disabled

    meson compile -C build
}

package() {
    cd hyprland-nosystemd-git

    meson install -C build \
      --destdir "$pkgdir" \
      --skip-subprojects hyprland-protocols
    mv "$pkgdir/usr/include/wlr" "$pkgdir/usr/include/hyprland/wlroots"

    # resolve conflicts with system wlr
    rm -f "$pkgdir/usr/lib/libwlroots.so"
    rm -rf "$pkgdir/usr/lib/pkgconfig"

    # FIXME: remove after xdg-desktop-portal-hyprland disowns hyprland-portals.conf

    rm -rf "$pkgdir/usr/share/xdg-desktop-portal"

    # license
    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
}
