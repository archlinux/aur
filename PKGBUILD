# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

pkgname=gamescope
pkgver=3.14.22
pkgrel=1
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
  cmake # for openvr
  git
  glslang
  meson
  ninja
  vulkan-headers
  wayland-protocols
)
_tag=3b69847e15c84c0a4f93e82c2eb16b623f9765b9
source=(
  git+https://github.com/ValveSoftware/gamescope.git#tag=${_tag}
  git+https://github.com/Joshua-Ashton/wlroots.git
  git+https://gitlab.freedesktop.org/emersion/libliftoff.git
  git+https://github.com/Joshua-Ashton/vkroots.git
  git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git
  git+https://github.com/ValveSoftware/openvr.git
  git+https://github.com/Joshua-Ashton/reshade.git
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
)
b2sums=('5f2fd5a052da71a8daf8518e306d0bfc49802f7e246cc3d9f454dce6a482eadc2c43db5c5458bd9ad4074c18bcd4ccad91da14a92f2df17671667c47da7b55c2'
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

  git submodule init subprojects/wlroots
  git config submodule.subprojects/wlroots.url ../wlroots

  git submodule init subprojects/libliftoff
  git config submodule.subprojects/libliftoff.url ../libliftoff

  git submodule init subprojects/vkroots
  git config submodule.subprojects/vkroots.url ../vkroots

  git submodule init subprojects/libdisplay-info
  git config submodule.subprojects/libdisplay-info.url ../libdisplay-info

  git submodule init subprojects/openvr
  git config submodule.subprojects/openvr.url ../openvr

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
    -Dforce_fallback_for=wlroots,libliftoff,vkroots,glm,stb,libdisplay-info \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build \
    --skip-subprojects
}

# vim: ts=2 sw=2 et:
