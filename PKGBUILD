# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Maintainer: moetayuko <loli at yuko dot moe>
# Contributor: FabioLolix
# Contributor: éclairevoyant
# Contributor: ThatOneCalculator <kainoa at t1c dot dev>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgname=hyprland-hidpi-xprop-git
pkgver=0.41.0.r18.6df397be
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks."
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/hyprwm/Hyprland"
license=(BSD)
depends=(
  cairo
  gcc-libs
  glib2
  glibc
  glslang
  hyprutils
  hyprcursor
  hyprlang
  hyprwayland-scanner
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
  systemd-libs
  tomlplusplus
  wayland
  wayland-protocols
  xcb-proto
  xcb-util
  xcb-util-errors
  xcb-util-image
  xcb-util-keysyms
  xcb-util-renderutil
  xcb-util-wm
  xorg-xinput
  xorg-xwayland-hidpi-xprop
)
depends+=(libdisplay-info.so)
makedepends=(
  cmake
  gdb
  git
  jq
  make
  meson
  ninja
  patch
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
source=(
  "git+https://github.com/hyprwm/Hyprland.git"
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
options=(debug)

pick_mr() {
  git pull origin pull/$1/head --no-edit
}

prepare() {
  cd Hyprland
  git submodule init
  git config submodule.subprojects/wlroots-hyprland.url "$srcdir/wlroots-hyprland"
  git config submodule.subprojects/hyprland-protocols.url "$srcdir/hyprland-protocols"
  git config submodule.subprojects/udis86.url "$srcdir/udis86"
  git config submodule.subprojects/tracy.update none
  git -c protocol.file.allow=always submodule update

  if [[ -z "$(git config --get user.name)" ]]; then
    git config user.name local && git config user.email '<>' && git config commit.gpgsign false
  fi
  # Pick pull requests from github using `pick_mr <pull request number>`.
  pick_mr 6446

  git -C subprojects/wlroots-hyprland reset --hard
}

pkgver() {
  git -C Hyprland describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd Hyprland

  export CXXFLAGS="-w" # suppress all compiler warnings
  meson setup build \
    --wipe \
    --prefix /usr \
    --libexecdir lib \
    --buildtype release \
    --wrap-mode nodownload \
    -D warning_level=0 \
    -D b_lto=true \
    -D b_pie=true \
    -D default_library=shared \
    -D xwayland=enabled \
    -D systemd=enabled

  meson compile -C build
}

package() {
  cd Hyprland

  meson install -C build --destdir "$pkgdir"

  # FIXME: remove after xdg-desktop-portal-hyprland disowns hyprland-portals.conf
  rm -rf "$pkgdir/usr/share/xdg-desktop-portal"

  # license
  install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE
}
# vi: et ts=2 sw=2
