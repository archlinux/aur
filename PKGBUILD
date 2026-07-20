# Maintainer: FabioLolix
# Maintainer: éclairevoyant
# Maintainer: alba4k <blaskoazzolaaaron[at]gmail.com>
# Contributor: ThatOneCalculator <kainoa at t1c dot dev>

_pkgname="hyprland"
pkgname="$_pkgname-git"
pkgver=0.56.0.r1.g5b260fa
pkgrel=1
pkgdesc="Hyprland is an independent, highly customizable, dynamic tiling Wayland compositor that doesn't sacrifice on its looks"
arch=('x86_64' 'aarch64')
url="https://github.com/hyprwm/Hyprland"
license=('BSD-3-Clause')

depends=(
  aquamarine-git
  cairo
  gcc-libs
  glib2
  glibc
  glslang
  hyprcursor-git
  hyprgraphics-git
  hyprland-guiutils-git
  hyprlang-git
  hyprutils-git
  hyprwire-git
  lcms2
  libdisplay-info
  libdrm
  libglvnd
  libinput
  libliftoff
  libx11
  libxcb
  libxcomposite
  libxcursor
  libxfixes
  libxkbcommon
  libxrender
  lua
  mesa
  muparser
  opengl-driver
  pango
  pixman
  polkit
  re2
  sdbus-cpp
  seatd
  systemd-libs
  tomlplusplus
  udis86-git
  util-linux-libs
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
  git
  glaze
  hyprland-protocols-git
  hyprwayland-scanner-git
  ninja
  #patch
  #pkgconf
  xorgproto
)
optdepends=(
  'cmake: to build and install plugins using hyprpm'
  'cpio: to build and install plugins using hyprpm'
  'glaze: to build and install plugins using hyprpm'
  'hyprqt6engine-git: the recommended way to manage qt styles'
  'meson: to build and install plugins using hyprpm'
  'rtkit: real-time scheduling support'
)

conflicts=("$_pkgname")
provides=("$_pkgname=${pkgver%%.r*}" "wayland-compositor")

_pkgsrc=$_pkgname
source=("$_pkgsrc::git+$url.git")
sha256sums=('SKIP')

backup=("usr/share/xdg-desktop-portal/hyprland-portals.conf")

pkgver() {
  cd "$_pkgsrc"
  local _tag=$(git tag -l --contains $(git describe --tags --abbrev=0) --sort=-v:refname | head -n1 | sed 's/^v//')
  printf "%s.r%s.g%s" "$_tag" $(git rev-list --count --cherry-pick "v${_tag}...HEAD") $(git rev-parse --short=7 HEAD)
}

build() {
  cd "$_pkgsrc"
  local cmake_options=(
    -B build
    -S .
    -G Ninja
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  cd "$_pkgsrc"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
