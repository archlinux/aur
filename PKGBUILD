# Aquamarine PKGBUILD maintainer: Nixuge

# Original PKGBUILD maintainers:
# Maintainer: FabioLolix
# Maintainer: éclairevoyant
# Contributor: ThatOneCalculator <kainoa at t1c dot dev>

# Please note that this is a package made quickly just for curious
# people who want to try out the new backend before it's merged
# into the main branch.
# It's going to disappear as soon as the aquamarine branch gets merged 
# (which isn't far away)

# Consider this package as a beta; there's a reason it's not merged yet.

pkgname=hyprland-aquamarine-git
pkgver=0.41.2.r132.5b1400f6
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor that doesn't sacrifice on its looks. (Aquamarine backend)"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/Hyprland/tree/aquamarine"
license=(BSD)
depends=(
  aquamarine # for now only provided by aquamarine-git
  cairo
  gcc-libs
  glib2
  glibc
  glslang
  hyprutils-git
  hyprcursor-git
  hyprlang-git
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
  xorg-xwayland
)
makedepends=(
  cmake
  gdb
  git
  hyprwayland-scanner-git
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
  "git+https://github.com/hyprwm/Hyprland.git#branch=aquamarine"
  "git+https://github.com/hyprwm/hyprland-protocols.git"
  "git+https://github.com/canihavesomecoffee/udis86.git"
)
b2sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pick_mr() {
  git pull origin pull/$1/head --no-edit
}

prepare() {
  echo "Please note that this should be treated as a beta. There's a reason why this backend isn't merged yet."
  echo "If you meant to install the normal stable hyprland, please use hyprland-git or hyprland"

  cd Hyprland
  git submodule init
  git config submodule.subprojects/hyprland-protocols.url "$srcdir/hyprland-protocols"
  git config submodule.subprojects/udis86.url "$srcdir/udis86"
  git config submodule.subprojects/tracy.update none
  git -c protocol.file.allow=always submodule update

  if [[ -z "$(git config --get user.name)" ]]; then
    git config user.name local && git config user.email '<>' && git config commit.gpgsign false
  fi
  # Pick pull requests from github using `pick_mr <pull request number>`.
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
