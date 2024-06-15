# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

pkgname=gamescope
pkgver=3.14.18
pkgrel=2
pkgdesc='SteamOS session compositing window manager'
arch=(x86_64)
url=https://github.com/ValveSoftware/gamescope
license=(BSD-2-Clause BSD-3-Clause)
depends=(
  gcc-libs
  glibc
  libavif
  libcap.so
  libdecor
  libdisplay-info.so
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
  openvr
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
  git
  glslang
  meson
  ninja
  vulkan-headers
  wayland-protocols
)
_tag=420eb91387a484fd7b1ea71449091f0480d9e538
source=(
  git+https://github.com/ValveSoftware/gamescope.git#tag=${_tag}
  git+https://github.com/Joshua-Ashton/reshade.git
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
)
b2sums=('bcdfcfdb7636d10c9d4450e03b252669a6ce9d5d21d241cde12bbf29feffaaf72bb785dce96682f43c25e0797cd6e5d13677e247d7c921e63ca1c27c8af04cb0'
        'SKIP'
        'SKIP')

prepare() {
  cd gamescope

  # Use shared libs, remove submodules to avoid fallback
  git rm subprojects/{libdisplay-info,openvr}

  meson subprojects download
  git submodule init src/reshade
  git config submodule.src/reshade.url ../reshade
  git submodule init thirdparty/SPIRV-Headers
  git config submodule.thirdparty/SPIRV-Headers.url ../SPIRV-Headers
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd gamescope
  git describe --tags | sed 's/-//'
}

build() {
  arch-meson gamescope build \
    -Dforce_fallback_for=wlroots,libliftoff,vkroots,glm,stb \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build \
    --skip-subprojects
}

# vim: ts=2 sw=2 et:
