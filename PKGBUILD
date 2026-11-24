# Maintainer: ray0rfire
# Dependencies follow Nexora's tested Hyprland 0.57.2 package recipe.
pkgname=hyprland-plus
pkgver=0.57.2.p4
pkgrel=1
_udis86=5336633af70f3917760a6d441ff02d93477b0c86
pkgdesc="Hyprland 0.57.2 with Halcyon window features, app-scoped pen pressure curves and Surface touchD integration"
arch=('x86_64')
url="https://github.com/trail-b1az3r/hyprland-plus"
license=('BSD-3-Clause')
depends=(
  "aquamarine>=0.16.0" cairo glib2 glslang hyprcursor hyprgraphics hyprland-guiutils
  hyprlang hyprutils hyprwire lcms2 libcanberra libdrm libei libglvnd
  libinput libx11 libxcb libxcomposite libxcursor libxfixes libxkbcommon
  libxrender lua mesa muparser opengl-driver pango pixman re2
  tomlplusplus util-linux-libs wayland wayland-protocols xcb-proto xcb-util
  xcb-util-errors xcb-util-image xcb-util-keysyms xcb-util-renderutil
  xcb-util-wm xorg-xwayland
)
makedepends=(cmake git glaze hyprland-protocols hyprwayland-scanner xorgproto)
optdepends=(
  'hyprpm: build and install plugins'
  'xdg-desktop-portal-hyprland: xdg-desktop-portal backend for Hyprland'
)
provides=("hyprland=${pkgver%.p*}" wayland-compositor)
conflicts=('hyprland')
source=(
  "hyprland-plus::git+https://github.com/trail-b1az3r/hyprland-plus.git#commit=ee4aa4d2096593c6267d9ff04b61263cffbbb5c0"
  "udis86::git+https://github.com/canihavesomecoffee/udis86.git#commit=${_udis86}"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd hyprland-plus
  git submodule init subprojects/udis86
  git config submodule.subprojects/udis86.url "$srcdir/udis86"
  git -c protocol.file.allow=always submodule update subprojects/udis86
}

build() {
  cd hyprland-plus
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -Wno-dev
  cmake --build build
}

package() {
  cd hyprland-plus
  DESTDIR="$pkgdir" cmake --install build
  rm -fv "$pkgdir/usr/include/hyprland/src/version.h.in"
  # hyprpm is provided by Arch's package and conflicts with the upstream copy.
  find "$pkgdir" -name '*hyprpm*' -delete
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 CREDITS.md "$pkgdir/usr/share/licenses/$pkgname/CREDITS.md"
  install -Dm644 LICENSE-MyGlass "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MyGlass"
  install -Dm644 subprojects/udis86/LICENSE "$pkgdir/usr/share/licenses/$pkgname/udis86/LICENSE"

  # Each Hyprland library at least as new as the one this was built against: unversioned, an upgrade of this
  # package alone left an older library in place and Hyprland could not start (libaquamarine.so.N not found).
  local i name version
  for i in "${!depends[@]}"; do
    name="${depends[$i]%%[<>=]*}"
    case "$name" in
      aquamarine|hyprcursor|hyprgraphics|hyprlang|hyprutils|hyprwire|hyprland-guiutils)
        version="$(pacman -Q "$name" 2>/dev/null | awk '{print $2}')"
        [[ -n "$version" ]] && depends[$i]="$name>=${version%-*}" ;;
    esac
  done
}
