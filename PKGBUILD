# Maintainer: FML128 <fml128@fml128.ch>

_pkgname=gamescope
pkgname=gamescope-fml
pkgver=3.14.22
pkgrel=1
pkgdesc='SteamOS session compositing window manager with added patches'
arch=(x86_64)
url=https://github.com/ValveSoftware/gamescope
license=(BSD)
conflicts=(gamescope)
provides=(gamescope)
depends=(
  gcc-libs
  glibc
  glm
  libcap.so
  libdisplay-info.so
  libglvnd
  libdrm
  libinput
  libpipewire-0.3.so
  libpixman-1.so
  libseat.so
  libudev.so
  libvulkan.so
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
  opengl-driver
  openvr
  sdl2
  vulkan-icd-loader
  wayland
  xcb-util-errors
  xcb-util-renderutil
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
source=(
  git+https://github.com/ValveSoftware/gamescope.git#tag=${pkgver}
  git+https://github.com/nothings/stb.git#commit=af1a5bc352164740c1cc1354942b1c6b72eacb8a
  git+https://github.com/Joshua-Ashton/reshade.git
  git+https://github.com/Joshua-Ashton/GamescopeShaders.git#tag=v0.1
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
  chimeraos.patch
)

sha256sums=('e891671d40025cf64444f70730d7eeb776a64884d500dd5d0a5bf326823fba27'
            'e39e0c91b297bfd707afcda84ecdc15a08c22e2ad4c347fc3533b1ed98fb3f85'
            'SKIP'
            '03726f2fb44ae79e6a398e8f9aaaf8054800dda9b8298726157522fe5f7296b1'
            'SKIP'
            '916d94178e52e68da3d9ab67151f51978bf31a6804de23b2ccd591b509b1be85')

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
  git submodule init src/reshade
  git config submodule.src/reshade.url "$srcdir/reshade"
  git submodule init thirdparty/SPIRV-Headers
  git config submodule.thirdparty/SPIRV-Headers.url ../SPIRV-Headers
  git -c protocol.file.allow=always submodule update

  # make stb.wrap use our local clone
  rm -rf subprojects/stb
  git clone "$srcdir/stb" subprojects/stb
  cp -av subprojects/packagefiles/stb/* subprojects/stb/ # patch from the .wrap we elided
}

pkgver() {
  cd gamescope
  git describe --tags | sed 's/-//'
}

build() {
  arch-meson gamescope build \
    -Dforce_fallback_for=stb,wlroots,vkroots,libliftoff,libdisplay-info \
    -Dpipewire=enabled \
    -Dinput_emulation=enabled \
    -Ddrm_backend=enabled \
    -Drt_cap=enabled \
    -Davif_screenshots=enabled \
    -Dsdl2_backend=enabled \
    -Denable_gamescope=true \
    -Denable_gamescope_wsi_layer=true
#    -Denable_openvr_support=true
  meson compile -C build
}

package() {
  install -d "$pkgdir"/usr/share/gamescope/reshade
  cp -r "$srcdir"/GamescopeShaders/* "$pkgdir"/usr/share/gamescope/reshade/
  chmod -R 655 "$pkgdir"/usr/share/gamescope

  DESTDIR="${pkgdir}" meson install -C build \
    --skip-subprojects
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}
