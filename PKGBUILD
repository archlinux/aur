# Maintainer:  sandwich <sandwich at archworks dot co>
# Contributor: Clément POIRET <poiret dot clement at outlook dot fr>
# Contributor: Julian Poidevin <poidevin dot julian at gmail dot com>

_pkgname="hyprland"
pkgname="${_pkgname}-displaylink-git"
pkgver=0.38.1
pkgrel=4
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (DisplayLink patch)"
arch=(any)
url="https://github.com/hyprwm/Hyprland"
license=('BSD')
depends=(
  cairo
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
  systemd-libs
  tomlplusplus
  wayland
  wayland-protocols
  wlroots-displaylink-git
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
  jq
  meson
  ninja
  pkgconf
  xorgproto
)
source=(
  "${pkgname}::git+https://github.com/hyprwm/Hyprland.git#tag=v${pkgver}"
  "displaylink.patch"
  )
provides=("${pkgname%-displaylink-git}")
conflicts=("${pkgname%-displaylink-git}")
sha256sums=('180182843ed6385c63aba2472a7fd46be240d85a0f41d417d3375b299f7dd296'
            '8547270650479714b91dccb98aa8e4bf5095eff6acd6855a60a1929ccccc1eba')
options=(!makeflags !buildflags !strip)

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive

    patch --directory="$srcdir/${pkgname}/subprojects/wlroots/" --forward --strip=1 \
        --input="$srcdir/displaylink.patch"
}

build() {
    cd "$srcdir/${pkgname}"

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
        -D           systemd=enabled

    meson compile -C build
}

package() {
  cd "$srcdir/${pkgname}"

  meson install -C build \
    --destdir "$pkgdir" \
    --skip-subprojects hyprland-protocols

  mkdir "$pkgdir/usr/include/hyprland/wlroots"
  mv "$pkgdir/usr/include/wlr" "$pkgdir/usr/include/hyprland/wlroots"

  # resolve conflicts with system wlr
  rm -f "$pkgdir/usr/lib/libwlroots.so"
  rm -f "$pkgdir/usr/lib/libwlroots.so.13"
  rm -rf "$pkgdir/usr/lib/pkgconfig"
  rm -rf "$pkgdir/usr/share/xdg-desktop-portal"

  # license
  install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
}
