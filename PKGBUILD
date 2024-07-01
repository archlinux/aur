# Maintainer: FML128 <fml128@fml128.ch>

_pkgname=gamescope
pkgname=gamescope-fml
pkgver=3.14.22
pkgrel=4
pkgdesc='SteamOS session compositing window manager with added patches'
arch=(x86_64)
url=https://github.com/ValveSoftware/gamescope
license=(BSD-2-Clause BSD-3-Clause)
conflicts=(gamescope)
provides=(gamescope)
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
source=(
  git+https://github.com/ValveSoftware/gamescope.git#tag=${pkgver}
  git+https://github.com/Joshua-Ashton/wlroots.git
  git+https://gitlab.freedesktop.org/emersion/libliftoff.git
  git+https://github.com/Joshua-Ashton/vkroots.git
  git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git
  git+https://github.com/ValveSoftware/openvr.git
  git+https://github.com/Joshua-Ashton/reshade.git
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
  chimeraos.patch
)
b2sums=('5f2fd5a052da71a8daf8518e306d0bfc49802f7e246cc3d9f454dce6a482eadc2c43db5c5458bd9ad4074c18bcd4ccad91da14a92f2df17671667c47da7b55c2'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '6b80233f7db7389526405b776f2d5d83848cafa3034350952026f10c041ce8bb48e0fbc4e5667eb63803870742112dfa4a67a21662616dac957a013e41215ef1')

prepare() {
  cd "$srcdir/$_pkgname"

  for src in "${source[@]}"; do
          src="${src%%::*}"
          src="${src##*/}"
          [[ $src = *.patch ]] || continue
          echo "Applying patch $src..."
          git apply "../$src"
      done
   
  #  meson subprojects download
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

