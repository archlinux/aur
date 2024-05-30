# Maintainer: dasnacl <aur@dasnacl.de>
# Modified based on hyprland-nvidia-nosystemd-git

pkgname=hyprland-nosystemd-git
pkgver=0.40.0.r145.5e6f7b1c
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (w/o systemd)"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/Hyprland"
license=('BSD')
depends=(
    cairo
    cpio
    gcc-libs
    glib2
    glibc
    glslang
    hyprlang
    hyprcursor
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
    hyprwayland-scanner-git
)
provides=("hyprland=${pkgver%%.r*}")
conflicts=(hyprland)
source=("$pkgname::git+https://github.com/hyprwm/Hyprland.git"
  "git+https://github.com/hyprwm/wlroots-hyprland.git"
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
    # use pkgver of hyprland-git package
    
    eval $(curl 'https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=hyprland-git' >/dev/null | grep pkgver | head -n1 | sed 's/pkgver/upstreamver/')
    echo $upstreamver
}

prepare() {
    cd hyprland-nosystemd-git
    git submodule init
    git config submodule.subprojects/wlroots-hyprland.url "$srcdir/wlroots-hyprland"
    git config submodule.subprojects/hyprland-protocols.url "$srcdir/hyprland-protocols"
    git config submodule.subprojects/udis86.url "$srcdir/udis86"
    git config submodule.subprojects/tracy.url "$srcdir/tracy"
    git -c protocol.file.allow=always submodule update

    git -C subprojects/wlroots-hyprland reset --hard
    sed -E -i -e "s/(soversion = .*$)/soversion = 13032/g" subprojects/wlroots-hyprland/meson.build
}

build() {
    cd hyprland-nosystemd-git

    CC=clang CXX="clang++" CC_LD=lld CXX_LD=lld meson setup build \
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

    mkdir -p "$pkgdir/usr/include/hyprland/wlroots"
    mv "$pkgdir/usr/include/wlr" "$pkgdir/usr/include/hyprland/wlroots"

    # FIXME: remove after xdg-desktop-portal-hyprland disowns hyprland-portals.conf
    rm -rf "$pkgdir/usr/share/xdg-desktop-portal"

    # license
    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
}
