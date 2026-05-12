# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprland-frozen
pkgver=0.54.0
pkgrel=1
pkgdesc="Frozen Hyprland v0.54 - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
conflicts=('hyprland-git' 'hyprland')
provides=('hyprland-frozen' 'wayland-compositor')
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/mirror-hyprland-v0.54.git"
license=('BSD-3-Clause')
backup=("usr/share/xdg-desktop-portal/hyprland-portals.conf")

depends=(
  aquamarine-frozen
  cairo
  gcc-libs
  glib2
  glibc
  glslang
  hyprcursor-frozen
  hyprgraphics-frozen
  hyprland-guiutils-frozen
  hyprlang-frozen
  hyprutils-frozen
  hyprwire-frozen
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
  seatd
  systemd-libs
  tomlplusplus
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
  hyprland-protocols-frozen
  hyprwayland-scanner-frozen
  ninja
  python # required by udis86
  xorgproto
)

optdepends=(
  'cmake: to build and install plugins using hyprpm'
  'cpio: to build and install plugins using hyprpm'
  'glaze: to build and install plugins using hyprpm'
  'hyprqt6engine-git: the recommended way to manage qt styles'
  'meson: to build and install plugins using hyprpm'
  'uwsm: the recommended way to start Hyprland'
)

_pkgsrc=$pkgname
source=(
  "$_pkgsrc::git+$url"
  "udis86::git+https://github.com/canihavesomecoffee/udis86.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

backup=("usr/share/xdg-desktop-portal/hyprland-portals.conf")

prepare() {
  cd "$_pkgsrc"
  git submodule init
  git config submodule.subprojects/udis86.url "$srcdir/udis86"
  git config submodule.subprojects/tracy.update none
  git -c protocol.file.allow=always submodule update

  if [[ -z "$(git config --get user.name)" ]]; then
    git config user.name local && git config user.email '<>' && git config commit.gpgsign false
  fi
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
  install -Dm0644 subprojects/udis86/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-udis86"
}
