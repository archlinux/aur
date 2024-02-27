pkgname=hyprland-asan-git
pkgver=0.35.0.r104.bc3f5b94
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (with address sanitizer)"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/Hyprland"
license=(BSD)
depends=(
  cairo
  gcc-libs
  glib2
  glibc
  glslang
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
  opengl-driver
  pango
  pixman
  polkit
  seatd
  systemd-libs
  tomlplusplus
  wayland-asan-git
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
  pkgconf
  xorgproto
)
provides=("${pkgname%-asan-git}" "${pkgname/-asan/}=${pkgver%%.r*}")
conflicts=(hyprland)
source=(
  "git+https://github.com/hyprwm/Hyprland.git"
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

prepare() {
  cd Hyprland
  git submodule init
  git config submodule.wlroots.url "$srcdir/wlroots"
  git config submodule.subprojects/hyprland-protocols.url "$srcdir/hyprland-protocols"
  git config submodule.subprojects/udis86.url "$srcdir/udis86"
  git config submodule.subprojects/tracy.url "$srcdir/tracy"
  git -c protocol.file.allow=always submodule update

  if [[ -z "$(git config --get user.name)" ]]; then
    git config user.name local && git config user.email '<>' && git config commit.gpgsign false
  fi
  # Pick pull requests from github using `pick_mr <pull request number>`.

  git -C subprojects/wlroots reset --hard
  sed -E -i -e "s/(soversion = .*$)/soversion = 13032/g" subprojects/wlroots/meson.build
  patch -Np1 < ../../envs.patch
}

pkgver() {
  git -C Hyprland describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd Hyprland

  meson setup build \
    --prefix     /usr \
    --libexecdir lib \
    --sbindir    bin \
    --buildtype  debug \
    --wrap-mode  nodownload \
    -D           b_lto=true \
    -D           b_pie=true \
    -D           b_sanitize=address \
    -D           default_library=shared \
    -D           xwayland=enabled

  meson compile -C build
}

package() {
  cd Hyprland

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

post_install() {
  note "When starting Hyprland with this package, remember to use '-c ~/.config/hyprland.conf' if you need to load your main config."
}
# vi: et ts=2 sw=2
