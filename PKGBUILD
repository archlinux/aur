# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

pkgname=gamescope
pkgver=3.14.24
pkgrel=1
pkgdesc='SteamOS session compositing window manager'
arch=(x86_64)
url=https://github.com/ValveSoftware/gamescope
license=(BSD-2-Clause BSD-3-Clause LicenseRef-Reshade)
depends=(
  gcc-libs
  glibc
  libavif
  libcap.so
  libdecor
  libdrm
  libinput
  libpipewire-0.3.so
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon.so
  libxmu
  libxrender
  libxres
  libxtst
  libxxf86vm
  sdl2
  seatd
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
_tag=cf2497fd7ec83f3d0dd5cb31b69540a2d129edad
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
b2sums=('272b4df0782c6dfe3f428e396f4e2ab93594e6b086bba25d0116995883e84944788760a24feb0d8a61d615c4d4ecee9d7648a5cdcee128620aaa9d24d2606284'
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
