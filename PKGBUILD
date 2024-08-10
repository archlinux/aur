# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

pkgname=gamescope
pkgver=3.14.29
pkgrel=1
pkgdesc='SteamOS session compositing window manager'
arch=(x86_64)
url=https://github.com/ValveSoftware/gamescope
license=(
  BSD-2-Clause
  BSD-3-Clause
  LicenseRef-Reshade
)
depends=(
  gcc-libs
  glibc
  lcms2
  libavif
  libcap.so
  libdecor
  libdrm
  libei
  libinput
  libpipewire-0.3.so
  libx11
  libxcb
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxkbcommon.so
  libxmu
  libxrender
  libxres
  libxtst
  libxxf86vm
  pixman
  sdl2
  seatd
  systemd-libs
  vulkan-icd-loader
  wayland
  xcb-util-errors
  xcb-util-wm
  xorg-server-xwayland
)
makedepends=(
  benchmark
  cmake
  git
  glslang
  meson
  ninja
  vulkan-headers
  wayland-protocols
)
_tag=db245f3963e5ee27ed41acdf4a50c65d6ed38932
source=(
  git+https://github.com/ValveSoftware/gamescope.git#tag=${_tag}
  git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git
  git+https://gitlab.freedesktop.org/emersion/libliftoff.git
  git+https://github.com/ValveSoftware/openvr.git
  git+https://github.com/Joshua-Ashton/reshade.git
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
  git+https://github.com/Joshua-Ashton/vkroots.git
  git+https://github.com/Joshua-Ashton/wlroots.git
)
b2sums=('4a28e153f5ef63b73695b83cc5dea8352fc2b910dca2efc135f1542d89e229e9c397881d245cb9ab91cdd990085d8d385488af44616d49c3b2c0be8c63e669a3'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd gamescope

  meson subprojects download

  for submodule in src/reshade subprojects/{libdisplay-info,libliftoff,openvr,vkroots,wlroots} thirdparty/SPIRV-Headers; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../${submodule##*/}
  done
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd gamescope
  git describe --tags | sed 's/-//'
}

build() {
  arch-meson gamescope build \
    -Dforce_fallback_for=glm,stb,libdisplay-info,libliftoff,vkroots,wlroots \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build \
    --skip-subprojects
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}

# vim: ts=2 sw=2 et:
