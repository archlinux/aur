# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>

_pkgname=gamescope
pkgname=gamescope-ogc
pkgver=3.16.19
pkgrel=1
pkgdesc='Open Gaming Collective fork of Gamescope compositing window manager'
arch=(x86_64)
url=https://github.com/OpenGamingCollective/gamescope
license=(BSD-2-Clause)
depends=(
  gcc-libs
  glibc
  glm
  hwdata
  lcms2
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
  libxkbcommon
  libxmu
  libxrender
  libxres
  libxtst
  libxxf86vm
  luajit
  seatd
  sdl2
  vulkan-icd-loader
  wayland
  xcb-util-wm
  xcb-util-errors
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
source=(
  "git+https://github.com/OpenGamingCollective/gamescope.git#tag=${pkgver}"
  'git+https://github.com/Joshua-Ashton/GamescopeShaders.git#tag=v0.1'
  'git+https://github.com/Joshua-Ashton/reshade.git'
  'git+https://github.com/Joshua-Ashton/vkroots.git'
  'git+https://github.com/Joshua-Ashton/wlroots.git'
  'git+https://github.com/KhronosGroup/SPIRV-Headers.git'
  'git+https://github.com/ValveSoftware/openvr.git'
  'git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git'
  'git+https://gitlab.freedesktop.org/emersion/libliftoff.git'
)

b2sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

conflicts=(gamescope)
provides=(gamescope)

prepare() {
  cd "$_pkgname"

  # Add custom patches if needed
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    git apply -v "../$src"
  done

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

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  cd "$_pkgname"
  arch-meson . build \
    -Dforce_fallback_for=stb,wlroots,vkroots,libliftoff,glm,libdisplay-info \
    -Dpipewire=enabled
  ninja -C build
}

package() {
  cd "$srcdir/$_pkgname"

  install -d "$pkgdir"/usr/share/gamescope/reshade
  cp -r "$srcdir"/GamescopeShaders/* "$pkgdir"/usr/share/gamescope/reshade/
  chmod -R 755 "$pkgdir"/usr/share/gamescope

  meson install -C build --skip-subprojects --destdir="${pkgdir}"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
