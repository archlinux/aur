# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Maintainer: moetayuko <loli at yuko dot moe>
# Contributor: FabioLolix
# Contributor: éclairevoyant
# Contributor: ThatOneCalculator <kainoa at t1c dot dev>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: lilydjwg <lilydjwg@gmail.com>

_pkgname=hyprland
pkgname=$_pkgname-hidpi-xprop
pkgver=0.41.2
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
provides=("hyprland=${pkgver%%+r*}")
conflicts=(hyprland)
source=(
  "git+https://github.com/hyprwm/Hyprland.git#tag=v0.41.2"
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

prepare() {
  cd Hyprland
  git submodule init
  git config submodule.subprojects/wlroots-hyprland.url "$srcdir/wlroots-hyprland"
  git config submodule.subprojects/hyprland-protocols.url "$srcdir/hyprland-protocols"
  git config submodule.subprojects/udis86.url "$srcdir/udis86"
  git config submodule.subprojects/tracy.update none
  git -c protocol.file.allow=always submodule update
  git cherry-pick -n 5c68846a9408c8974d73952a2859781467e59d34
}

pkgver() {
  git -C Hyprland describe --tags | sed -r 's/^v//;s/\.([a-z])/\1/;s/([a-z])\./\1/;s/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd Hyprland

  mkdir -p build && cd build
  cmake -G Ninja -DCMAKE_BUILD_TYPE=None -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX=/usr ..
  ninja
}

package() {
  cd Hyprland
  find src \( -name '*.h' -o -name '*.hpp' \) -exec install -Dm0644 {} "$pkgdir/usr/include/hyprland/{}" \;
  meson install -C subprojects/wlroots-hyprland/build --destdir "${pkgdir}/tmpwlr"
  cp -R ${pkgdir}/tmpwlr/usr/local/include/hyprland ${pkgdir}/usr/include/
  rm -rf ${pkgdir}/tmpwlr
  mkdir -p "$pkgdir/usr/include/hyprland/protocols"
  cp protocols/*.h* "$pkgdir/usr/include/hyprland/protocols"
  install -Dm0644 -t "$pkgdir/usr/share/pkgconfig" build/hyprland.pc
  install -Dm0644 -t "$pkgdir/usr/share/man/man1" docs/{Hyprland,hyprctl}.1
  for cmd in hyprctl hyprpm; do
    install -Dm0644 "$cmd/$cmd.bash" "$pkgdir/usr/share/bash-completion/completions/$cmd"
    install -Dm0644 "$cmd/$cmd.zsh" "$pkgdir/usr/share/zsh/site-functions/_$cmd"
    install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" "$cmd/$cmd.fish"
  done
  install -Dm0755 -t "$pkgdir/usr/bin/" build/Hyprland build/hyprctl/hyprctl build/hyprpm/hyprpm
  install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/" assets/*.png
  install -Dm0644 -t "$pkgdir/usr/share/wayland-sessions/" "example/$_pkgname.desktop"
  install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/" "example/$_pkgname.conf"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 subprojects/wlroots-hyprland/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-wlroots-hyprland"
  install -Dm0644 subprojects/udis86/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-udis86"
}
# vi: et ts=2 sw=2
